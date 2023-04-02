from repository import *

'''to check if he is within limit ot borrow'''


def get_member_status(member_status_id):
    print('get_member_status =', member_status_id)
    member_status_record = get_record(table_name=MEMBER_STATUS_DICT[TABLE_NAME], col_name=MEMBER_STATUS_DICT[PK],
                                      field_value=member_status_id)
    return member_status_record[1]


if __name__ == '__main__':
    # get_member_status_active()
    print('start')
