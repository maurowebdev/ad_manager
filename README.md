# Ad Manager

1. **Ad Manager (Rails)**: A web application for managing advertisements
2. **Ad Node Server**: A Node.js server for serving ad content

## Features

### Ad Manager (Rails)

- **Highlights**:
  - Hotwire (Turbo & Stimulus) for dynamic updates
  - Tailwind CSS for styling
  - Redis for caching and background jobs
  - Sidekiq for background processing

- *Real-time Features*:
  - Live view count updates using Turbo Streams
  - Automatic view count synchronization every 5 minutes
  - Real-time image upload status updates

- *Authentication & Authorization*:
  - User authentication with Devise
  - Account-based organization structure
  - Secure user sessions

- *Image Management*:
  - Multiple image upload support
  - Automatic image processing and optimization
  - Redis-based image path caching

- *Background Processing*:
  - Automated view count updates via cron jobs
  - Asynchronous image processing
  - Redis-based job queuing

### Ad Node Server

- **High-Performance Ad Serving**:
  - Node.js-based server for optimal performance
  - Efficient ad content delivery
  - Real-time view tracking

- **API Features**:
  - RESTful API endpoints
  - JSON response format
  - Rate limiting and security measures

### Prerequisites

- Ruby 3.2.2
- Node.js
- PostgreSQL
- Redis
- Sidekiq

### Ad Manager Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rails db:create db:migrate
   ```

4. Start Redis:
   ```bash
   redis-server
   ```

5. Start Sidekiq:
   ```bash
   bundle exec sidekiq
   ```

6. Start the Rails server:
   ```bash
   rails server
   ```

### Ad Node Server Setup

1. Navigate to the ad_node_server directory:
   ```bash
   cd ad_node_server
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the server:
   ```bash
   npm start
   ```

## Testing

The project includes comprehensive test coverage:

- Model specs with RSpec
- Request specs for API endpoints
- Factory Bot for test data generation
- Faker for realistic test data
- Shoulda Matchers for simplified test assertions

Run the test suite:
```bash
bundle exec rspec
```

## Architecture

### System Design

- **Ad Manager**: Handles user interface, authentication, and ad management
- **Ad Node Server**: Serves ad content and tracks views
- **Redis**: Manages caching and job queues
- **Sidekiq**: Processes background jobs and scheduled tasks

### Key Components

1. **View Count System**:
   - Real-time updates via Turbo Streams
   - Background synchronization every 5 minutes
   - Redis-based caching for performance

2. **Image Processing**:
   - Asynchronous upload handling
   - Redis-based path caching
   - Multiple image support

3. **Background Jobs**:
   - Scheduled view count updates
   - Image processing tasks
   - Data synchronization
