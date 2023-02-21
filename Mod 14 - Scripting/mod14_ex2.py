import os
import sys

import pandas as pd

import matplotlib.pyplot as plt
import seaborn as sns

sns.set_theme()

def load_dataset(month = 'JAN'):
    return pd.read_csv('./data/SINASC_RO_2019_'+month+'.csv')

def plot_graph(month = 'JAN', values = 'IDADEMAE', index = 'DTNASC', aggfunc = 'mean'):
    df = load_dataset(month = month)
    g = pd.pivot_table(df, values=values, index=index,
                       aggfunc=aggfunc).plot(figsize=[15, 5])
    plt.ylabel(values)
    plt.xlabel(index)
    return g

def create_graph(month = 'JAN', values = 'IDADEMAE', index = 'DTNASC', aggfunc = 'mean'):
    os.makedirs('./output/'+month, exist_ok=True)
    g = plot_graph(month = month, values = values, index = index, aggfunc = aggfunc)
    plt.savefig('output/'+month+'/'+month+'_'+values+'_'+index+'_'+aggfunc+'_graph.png')


list_arg = sys.argv

if len(list_arg) > 1:
    month_list = ['JAN', 'FEV', 'MAR', 'ABR', 'MAI', 'JUN', 'JUL', 'AGO', 'SET', 'OUT', 'NOV', 'DEZ']
    for i in range(1, len(list_arg)):
        if list_arg[i] in month_list:
            create_graph(month = list_arg[i])
            print(f"Relatório para {list_arg[i]} foi gerado com sucesso!")
        else:
            print(f"O parametro {list_arg[i]} não foi reconhecido. Use apenas meses apreviados (exemplo: JAN)")
    
else:
    print('Informe os meses (abreviados) para geração dos relatórios')
