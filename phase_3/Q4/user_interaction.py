from service_book import *
from service_member import *
from service_loan import *


def display_menu():
    print('Choose one of the below numbers for corresponding actions')
    print('1. New Member')
    print('2. New Book')
    print('0. EXIT')

    option = int(input('Choose Option'))
    return option


def new_member():
    print('Enter new member information below')
    member_name = input('Member Name: ')
    ssn = input('SSN: ')
    campus_address = input('Campus Address: ')
    home_address = input('Home Address: ')
    phone_number = input('Phone Number: ')

    return add_new_member(member_name, ssn, campus_address, home_address, phone_number)


def new_book():
    book_fk_lists = get_book_fk_list()

    print('Enter new book information below')
    title = input('Book Title: ')
    description = input('Description: ')
    print(book_fk_lists['author_list'])
    author_id = int(input('Choose one Author: '))
    print(book_fk_lists['subject_area_list'])
    subject_area_id = int(input('Choose subject area: '))
    print(book_fk_lists['binding_list'])
    binding_id = int(input('Choose binding type: '))
    print(book_fk_lists['lang_list'])
    lang_id = int(input('Choose language: '))
    print(book_fk_lists['book_category_list'])
    book_category_id = int(input('Choose book category: '))

    return add_new_book(title, description, book_category_id, author_id, subject_area_id, binding_id, lang_id,
                        book_fk_lists)


def loan_book():
    print('Enter your Member ID and Book ISBN')
    member_id = input('Member Id: ')
    isbn = input('Book ISBN: ')
    # return get_book_loan(str(1), str(1))
    return get_book_loan(member_id, isbn)



def main():
    option = display_menu()

    #option = 3
    if option == 1:
        output, member_id = new_member()
        print('--------------------')
        print('Member ID:', member_id)
        print('--------------------')
    elif option == 2:
        output, isbn = new_book()
        print('--------------------')
        print('Book ISBN:', isbn)
        print('--------------------')
    elif option == 3:
        output = loan_book()
        print('--------------------')
        print(output)
        print('--------------------')
    elif option == 0:
        print('Exiting program')
        exit(0)

    print(output)


if __name__ == '__main__':
    main()
