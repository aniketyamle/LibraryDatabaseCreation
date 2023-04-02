from repository import *


def add_new_book(title, description, book_category_id, author_id, subject_area_id, binding_id, lang_id, book_fk_lists):
    db_record = [title, description, book_category_id, author_id, subject_area_id, binding_id, lang_id]
    saving_book, isbn = save_book(db_record)

    status = ''
    book_category_dict = get_book_category_dict(book_fk_lists['book_category_list'])

    if saving_book == 'Success':
        if book_category_id == book_category_dict['can be lent']:
            available_count = int(input('How many copies? '))
            loan_count = 0
            lending_record = [loan_count, available_count, isbn]
            status, book_for_lending_id = save_book_for_lending(lending_record)
            return status, isbn
        elif book_category_id == book_category_dict['interested to acquire']:
            print(book_fk_lists['reason_list'])
            reason_id = int(input('Choose one of the above reasons: '))
            interest_to_acquire_record = [isbn, reason_id]
            status, interested_to_acquire_id = save_interest_to_acquire(interest_to_acquire_record)
            return status, isbn
        else:
            return saving_book, isbn
    else:
        return saving_book, isbn


def get_book_category_dict(book_category_list):
    book_category_dict = {}

    for (i, v) in enumerate(book_category_list):
        book_category_dict[v[1]] = v[0]

    return book_category_dict


def get_book_fk_list():
    book_fk_list_dict = {
        'lang_list': get_all(LANG),
        'binding_list': get_all(BINDING),
        'subject_area_list': get_all(SUBJECT_AREA),
        'author_list': get_all(AUTHOR),
        'book_category_list': get_all(BOOK_CATEGORY),
        'reason_list': get_all(REASON)
    }

    return book_fk_list_dict
