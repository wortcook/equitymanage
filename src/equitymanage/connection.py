import psycopg2
import dotenv
import os

dotenv.load_dotenv()

class DataConnect:
    def connect(self):
        params = {
            'dbname': os.environ.get("DB_NAME"),
            'user': os.environ.get("DB_USER"),
            'password': os.environ.get("DB_PASSWORD"),
            'host': os.environ.get("DB_HOST"),
            'port': os.environ.get("DB_PORT")
        }

        # Connect to the PostgreSQL database
        conn = psycopg2.connect(**params)

        # Create a cursor object
        cur = conn.cursor()

        return conn, cur

    def disconnect(self, conn, cur):
        cur.close()
        # Close the cursor and connection
        conn.close()