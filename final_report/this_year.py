import pandas as pd
import numpy as  np
import warnings
warnings.filterwarnings("ignore")
import sys


print ('argument list', sys.argv)
option = sys.argv[1]

CRED= '\033[91m'
CGREEN = '\033[92m'
CEND = '\033[0m'

og_file=pd.read_csv(f'liked_songs.csv', header=0)
this_year=og_file[og_file['Added At'].str.contains('2024', na=False)]
last_year=og_file[og_file['Added At'].str.contains('2023', na=False)]

popularity=this_year['Popularity'].mean()

tempo=this_year['Tempo'].mean()

obscurity=this_year['Popularity'].value_counts().sort_index()
obscurity=obscurity[:11].to_list()
obscurity=sum(obscurity)

artists=pd.DataFrame()
artists['Artists']=this_year['Artist Name(s)'].value_counts().index.to_list()
artists['Count']=this_year['Artist Name(s)'].value_counts().to_list()

last_artists=pd.DataFrame()
last_artists['Artists']=last_year['Artist Name(s)'].value_counts().index.to_list()
last_artists['Count']=last_year['Artist Name(s)'].value_counts().to_list()


comp_artists=pd.DataFrame()
comp_artists['2024']=artists['Artists'][:10]
comp_artists['  ']=artists['Count'][:10]
comp_artists['2023']=last_artists['Artists'][:10]
comp_artists['　　']=last_artists['Count'][:10]

for i in range(0, len(comp_artists)):
    if(comp_artists['2024'][i]in comp_artists['2023'].value_counts()):
        temp=comp_artists['2024'][i]
        ans=comp_artists['2023'].to_list().index(temp)
        comp_artists['2024'][i]=CGREEN+"　　　　　　　　　"+comp_artists['2024'][i]+CEND
        comp_artists['2023'][ans]=CGREEN+"　　　　　　　　　"+comp_artists['2023'][ans]+CEND

comp_artists.style.set_properties(**{'text-align': 'left'})
        


obscurity_comp=last_year['Popularity'].value_counts().sort_index()
obscurity_comp=obscurity_comp[:11].to_list()
obscurity_comp=sum(obscurity_comp)




if(option=="--wrapped"):
    print("\nTHIS YEAR'S TOP ARTISTS\n", artists[:10].to_string(index=False))
    print("\nAverage popularity =", "{:.2f}".format(popularity), "\n")
    print("Average tempo =", tempo, "\n")
    print("You liked", obscurity, "obscure songs this year.\n")
    print("You liked songs from", len(artists), "artists this year.\n")
    
elif(option=="--comparison"):
    print("\nTHIS YEAR VS LAST YEAR'S TOP ARTISTS\n", comp_artists[:10].to_string(index=False))
    
    popularity=this_year['Popularity'].mean()/last_year['Popularity'].mean()
    print("\n on average, you liked songs that are", "{:.2f}".format(popularity), "times more popular than last year\n")
    
    if(obscurity-obscurity_comp<0):
        print("\n you liked", obscurity, "obscure songs,", CRED, abs(obscurity-obscurity_comp), "less than last year\n", CEND)
    else:
        print("\n you liked", obscurity, "obscure songs,", abs(obscurity-obscurity_comp), "more than last year\n")
        
    if(len(this_year)-len(last_year)<0):
        print("\n you liked",len(this_year), "songs in total,", CRED, abs(len(this_year)-len(last_year)), "less than last year\n", CEND)
    else:
        print("\n you liked",len(this_year), "songs in total,", abs(len(this_year)-len(last_year)), "more than last year\n")    
            
    if(len(artists)-len(last_artists)<0):
        print("\n you liked songs by",len(artists),"artists,", CRED, abs(len(artists)-len(last_artists)), "less than last year\n", CEND)
    else:
        print("\n you liked songs by",len(artists),"artists,", abs(len(artists)-len(last_artists)), "more than last year\n")

else:
    print("error\n")