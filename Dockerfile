FROM node:alpine

WORKDIR /app

# Install backend dependencies
COPY TODO/todo_backend/package*.json ./TODO/todo_backend/
RUN cd TODO/todo_backend && npm install --production

# Install frontend dependencies & build
COPY TODO/todo_frontend/package*.json ./TODO/todo_frontend/
RUN cd TODO/todo_frontend && npm install

# Copy all source files
COPY . .

# Build frontend and move to backend/static
RUN cd TODO/todo_frontend && npm run build && mv build ../todo_backend/static

EXPOSE 5000

WORKDIR /app/TODO/todo_backend

CMD ["npm", "start"]