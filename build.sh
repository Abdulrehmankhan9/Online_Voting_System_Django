#!/bin/bash
set -o errexit  # Stop the script if any command fails

echo "Starting Django project setup..."

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements.txt

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --no-input

# Run migrations
echo "Running migrations..."
python manage.py migrate

# Create superuser if needed
if [[ $CREATE_SUPERUSER ]]; then
  echo "Creating superuser..."
  python manage.py createsuperuser --no-input --email "$DJANGO_SUPERUSER_EMAIL"
fi

echo "Setup complete!"
