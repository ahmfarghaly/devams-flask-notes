FROM python:3.7.3-alpine

## Step 1:
# Create a working directory
WORKDIR /notes-webapp

## Step 2:
# Copy source code to working directory
COPY . app.py /notes-webapp/
COPY static static/
COPY templates templates/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN python -m pip install --upgrade pip &&\
    python -m pip install --trusted-host pypi.python.org -r requirements.txt
RUN ls
## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python","app.py"] 
