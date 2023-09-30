# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and yarn.lock (if available) to the container
COPY package.json yarn.lock* ./

# Install project dependencies
RUN yarn install

# Copy the rest of the application code to the container
COPY . .

# Build the React app for production
RUN yarn build

# Expose port 80 for the application
EXPOSE 80

# Start the application
CMD ["yarn", "start"]
