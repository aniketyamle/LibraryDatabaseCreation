import pymysql
from constants import *

#DB = LOCAL_DB
DB = OMEGA_DB     # Enable this for demo


def connect_db_fetch_data(sql_query):
    try:
        print('Start DB connection')
        connection = pymysql.connect(host=DB[HOSTNAME], user=DB[USERNAME], password=DB[PASSWORD], database=DB[DATABASE],
                                     port=3306)
        cursor = connection.cursor()

        cursor.execute(sql_query)
        output = cursor.fetchone()

        connection.close()

        return output[0]
    except Exception as e:
        print('Exception -> ', e)
        return 'Failed'


def connect_db_fetch_record(sql_query):
    try:
        print('Start DB connection')
        connection = pymysql.connect(host=DB[HOSTNAME], user=DB[USERNAME], password=DB[PASSWORD], database=DB[DATABASE],
                                     port=3306)
        cursor = connection.cursor()

        cursor.execute(sql_query)
        output = cursor.fetchone()

        connection.close()

        return output
    except Exception as e:
        print('Exception -> ', e)
        return 'Failed'


def connect_db_fetch_all(sql_query):
    try:
        print('Start DB connection')
        connection = pymysql.connect(host=DB[HOSTNAME], user=DB[USERNAME], password=DB[PASSWORD], database=DB[DATABASE],
                                     port=3306)
        cursor = connection.cursor()

        cursor.execute(sql_query)
        output = cursor.fetchall()

        connection.close()

        return output
    except Exception as e:
        print('Exception -> ', e)
        return 'Failed'


def connect_db_save_data(sql_query, db_record):
    try:
        print('Start DB connection')
        connection = pymysql.connect(host=DB[HOSTNAME], user=DB[USERNAME], password=DB[PASSWORD], database=DB[DATABASE],
                                     port=3306)
        cursor = connection.cursor()

        cursor.execute(sql_query, db_record)
        connection.commit()

        last_inserted_id_query = "select LAST_INSERT_ID()"
        cursor.execute(last_inserted_id_query)
        output = cursor.fetchone()

        connection.close()

        return 'Success', output[0]
    except Exception as e:
        print('Exception -> ', e)
        return 'Failed', -1


def connect_db_update_data(sql_query):
    try:
        print('Start DB connection')
        connection = pymysql.connect(host=DB[HOSTNAME], user=DB[USERNAME], password=DB[PASSWORD], database=DB[DATABASE],
                                     port=3306)
        cursor = connection.cursor()

        cursor.execute(sql_query)
        connection.commit()

        connection.close()

        return 'Success'
    except Exception as e:
        print('Exception -> ', e)
        return 'Failed'
