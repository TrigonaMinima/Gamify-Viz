# Generates all the required CSVs for the analysis

import pyexcel as pe
from pyexcel.ext import ods3
import json
import csv
import datetime


def load_data(filename):
    """
    Reads the data of the ods file (filename) and returns a pyexcel object.
    """

    # Gets the first sheet with all the data
    data = pe.get_sheet(
        file_name=filename, sheet_name="Data", name_columns_by_row=0)

    # Getting the number of days for which the data is available.
    total_days = (data[1, 0] - datetime.date.today()).days * -1

    # Removing unwanted rows.
    data.delete_rows(
        [0] + [i for i in range(total_days + 2, data.row_range().stop)])

    return data


def data_formatter(data):
    """Formats the date and time according to the need."""

    def handle_dates(v):
        return v.strftime('%d-%m-%Y')

    def handle_times(v):
        if v is None or v == "":
            return ""
        else:
            return v.strftime('%I:%M %p')

    dates = pe.formatters.ColumnFormatter(0, handle_dates)
    data.add_formatter(dates)

    times = pe.formatters.ColumnFormatter(
        [1, 2, 3, 4, 5, 6, 7, 8], handle_times)
    data.add_formatter(times)

    return data


def get_sleep_times(filename, csvfile):
    """
    Loads the data, removes unwanted columns,
    formats the data according to the requirement and
    then saves all the sleep times in a csv.
    """

    # Load the whole data
    data = load_data(filename)

    # Removing unwanted columns.
    data.delete_columns([i for i in range(1, 21)])
    data.delete_columns([i for i in range(11, data.width)])

    # Makes the format of date and time as required.
    data = data_formatter(data)

    # Saves the data
    data.save_as(filename=csvfile)
    print("1. Sleep times extracted...")


if __name__ == "__main__":

    # Data file
    ods_f = "/media/248GB/Dropbox/Quantified Self/Gamify.ods"
    csv_f = "/media/248GB/Dropbox/Quantified Self/sleep_times.csv"

    # Loads the sleep times
    sleep_times = get_sleep_times(ods_f, csv_f)
