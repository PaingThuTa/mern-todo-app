FROM node:alpine

WORKDIR /app

# Copy all source files first
COPY . .

# Install frontend dependencies and build
RUN cd TODO/todo_frontend && npm install && npm run build

# Move build output to backend/static
RUN mv TODO/todo_frontend/build TODO/todo_backend/static

# Install backend dependencies
RUN cd TODO/todo_backend && npm install --production

EXPOSE 5000

WORKDIR /app/TODO/todo_backend

CMD ["npm", "start"]