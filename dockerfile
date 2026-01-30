# 1. Use a lightweight Node environment
FROM node:20-alpine

# 2. Create app directory
WORKDIR /app

# 3. Install dependencies
# Copying package files first leverages Docker's cache
COPY package*.json ./
RUN npm install --production

# 4. Bundle app source
COPY . .

# 5. Render uses port 10000 by default for web services
ENV PORT=10000
EXPOSE 10000

# 6. Start the server
CMD ["node", "server.js"]
