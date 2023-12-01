import sys
sys.path.append("../")

import connection
import yfinance as yf
import psycopg2 as psycopg2
import datetime as datetime
import dotenv
import os

dotenv.load_dotenv()

################################

def get_latest_date_index():
    # Connect to the PostgreSQL database
    conn, cur = connection.get_conncur()

    #try-finally block to ensure that the connection is closed
    #even if an error occurs
    try:
        cur.execute("SELECT MAX(index_date), MAX(index) FROM date_index")
        result = cur.fetchone()

        return result
    finally:
        connection.return_conncur(conn, cur)


def updatedateindicies():
    ################################
    # CONSTANTS
    ################################
    REF_SYMBOL = "^GSPC"
    NOW = datetime.datetime.now()

    last_date = get_latest_date_index()[0]
    next_index = get_latest_date_index()[1]

    if last_date is None:
        last_date = datetime.datetime.strptime("2000-01-01", "%Y-%m-%d").date()
        next_index = 1
    else:
        last_date = last_date + datetime.timedelta(days=1)
        next_index += 1

    sp500_index_data = yf.Ticker(REF_SYMBOL)
    sp500_data = sp500_index_data.history(period="max", actions=False, start=last_date)

    try:
        conn, cur = connection.get_conncur()

        for index, row in sp500_data.iterrows():
        #truncate the index date to remove the time
            index_date = index.date()

            #if now is index_date and the time is before 8pm, then skip
            if NOW.date() == index_date and NOW.hour < 20:
                continue

            print("Inserting index date: " + str(index_date) + " with index: " + str(next_index))
        
            # Insert a new row into the date_index table
            cur.execute("INSERT INTO date_index (index_date, index) VALUES (%s, %s) ON CONFLICT(index_date) DO NOTHING", (index_date, next_index))

            #increment next_index
            next_index += 1

        conn.commit()
    finally:
        connection.return_conncur(conn, cur)



