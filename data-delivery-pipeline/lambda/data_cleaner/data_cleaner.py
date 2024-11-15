import pandas as pd

def clean_data(df):
    # Example cleaning function: drop NaNs and standardize date format
    df.dropna(inplace=True)
    df['Date'] = pd.to_datetime(df['Date'])
    return df
