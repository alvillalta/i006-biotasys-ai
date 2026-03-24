# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app

# Set work directory
WORKDIR /app

# Install system dependencies (including build tools and Cairo for xhtml2pdf/pycairo)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    pkg-config \
    libcairo2-dev \
    libpango1.0-dev \
    libgdk-pixbuf-xlib-2.0-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Install uv for fast dependency resolution
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# Copy project configuration files
COPY pyproject.toml ./
COPY uv.lock* ./

# Install dependencies
# If uv.lock exists, use it; otherwise resolve from pyproject.toml
RUN if [ -f uv.lock ]; then uv sync --frozen --no-install-project --no-dev; else uv sync --no-install-project --no-dev; fi

# Copy the rest of the application code
COPY . .

# Install the project itself
RUN if [ -f uv.lock ]; then uv sync --frozen --no-dev; else uv sync --no-dev; fi

# Expose port
EXPOSE 8000

# Command to run the application
# Use 'uv run' to execute in the virtual environment created by uv sync
CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
