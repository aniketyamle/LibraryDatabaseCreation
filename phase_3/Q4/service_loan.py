from repository import *
from service import *
import datetime


def get_book_loan(member_id, isbn):
    print('inside get_book_loan')
    member_record = get_record(table_name=MEMBER_DICT[TABLE_NAME], col_name=MEMBER_DICT[COL_NAME],
                               field_value=member_id)

    validate_member = validate_member_for_loan(member_id, member_record)

    if validate_member == 'Success':
        print('member validation done')
        validate_loan = validate_lending_for_loan(isbn)

        if validate_loan == "Success":
            print('lending validation done')
            date_today = datetime.date.today()
            date_of_borrowing = date_today.strftime('%Y-%m-%d')

            member_type_id = member_record[9]
            borrow_count = member_record[8] + 1

            borrow_period = get_member_borrowing_period_limit(member_type_id)

            # last_data_to_return = date_today.replace(day=date_today.day + borrow_period).strftime('%Y-%m-%d')
            last_data_to_return = date_today + datetime.timedelta(days=borrow_period)

            db_record = [isbn, member_id, date_of_borrowing, last_data_to_return]
            save_status, pk = save_loan(db_record)

            if save_status == 'Success':
                update_status = update_member_borrow_count(str(member_id), str(borrow_count))
                if update_status == "Success":
                    return 'Book loaned. Last Date to Return = ' + str(last_data_to_return)
                else:
                    return 'Failed to update borrow count in member table'
            else:
                return 'Failed to save loan'

            pass
        else:
            return validate_loan


def get_member_borrowing_period_limit(member_type_id):
    member_type_record = get_record(table_name=MEMBER_TYPE_DICT[TABLE_NAME], col_name=MEMBER_TYPE_DICT[PK],
                                    field_value=member_type_id)
    return member_type_record[2]


def get_member_book_limit(member_type_id):
    member_type_record = get_record(table_name=MEMBER_TYPE_DICT[TABLE_NAME], col_name=MEMBER_TYPE_DICT[PK],
                                    field_value=member_type_id)
    return member_type_record[4]


def validate_member_for_loan(member_id, member_record):

    member_type_id, member_status_id = member_record[9], member_record[10]
    borrow_count = member_record[8]

    member_status = get_member_status(str(member_status_id))

    if member_status == 'active':
        member_book_limit = get_member_book_limit(member_type_id)

        if borrow_count < member_book_limit:
            return 'Success'
        else:
            return 'Member has borrows books to their allowed limit'

    else:
        return 'Member is inactive. Cannot loan a book'


def validate_lending_for_loan(isbn):
    lending_record = get_record(table_name=BOOK_FOR_LENDING_DICT[TABLE_NAME], col_name=BOOK_FOR_LENDING_DICT[COL_NAME],
                                field_value=isbn)

    if lending_record:
        pk, loan_count, available_count = lending_record[0], lending_record[1], lending_record[2]

        if available_count == 0:
            return 'No copies available to lend at the moment'
        elif available_count > 0:
            update_status = update_book_for_lending(str(loan_count + 1), str(available_count - 1), str(pk))
            return update_status
    else:
        return 'This book is not for lending'
