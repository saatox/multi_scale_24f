import pandas as pd
import numpy as  np
import sys




og_file=pd.read_csv(f'liked_songs.csv', header=0)

popularity=og_file['Popularity'].mean()
tempo=og_file['Tempo'].mean()

obscurity=og_file['Popularity'].value_counts().sort_index()
obscurity=obscurity[:11].to_list()
obscurity=sum(obscurity)

artists=pd.DataFrame()
artists['Artists']=og_file['Artist Name(s)'].value_counts().index.to_list()
artists['Count']=og_file['Artist Name(s)'].value_counts().to_list()
artist_count=artists.count().to_list()
artist_count=artist_count[0]


print("ALL TIME TOP ARTISTS\n", artists[:10].to_string(index=False))
print("\nAverage popularity =", popularity, "\n")
print("Average tempo =", tempo, "\n")
print("You like", obscurity, "obscure songs.\n")
print("You have liked songs from", artist_count, "artists.\n")




