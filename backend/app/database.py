import os
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from dotenv import load_dotenv

# Load variables from the .env file
load_dotenv()

# We get the database URL from an environment variable for security
# If not found, it defaults to a local postgres (useful for dev)
SQLALCHEMY_DATABASE_URL = os.getenv(
    "DATABASE_URL", 
    "postgresql://postgres:password@localhost/vite_gourmand"
)

# --- Engine Configuration ---
# 'pool_pre_ping' checks if the connection is still alive before using it
# 'pool_size' and 'max_overflow' allow the app to handle many users at once
engine = create_engine(
    SQLALCHEMY_DATABASE_URL,
    pool_pre_ping=True,
    pool_size=10,
    max_overflow=20
)

# SessionLocal: Each instance will be a database "conversation"
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# --- Dependency Injection ---
# This 'generator' function provides a database session for each API request.
# The 'yield' ensures the request happens, and 'finally' ensures the 
# connection is closed even if the code crashes, preventing memory leaks.
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()