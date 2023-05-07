# Imports
import streamlit as st
import pandas as pd
import numpy as np

import plotly.express as px

from sklearn.preprocessing import Normalizer
from sklearn.cluster import KMeans


def carregar_dataset(selected_columns):
    data = st.file_uploader("Carregue o CSV Online Shoppers Purchasing Intention", type = ['csv'])
    if(data is not None):
        df = pd.read_csv(data)
        check_col = set(selected_columns).issubset(df.columns)
        if check_col:
            return df
        else:
            return False
    return None

def main():
    # Configuração inicial da página da aplicação
    st.set_page_config(page_title = 'Clustering - Online Shopping', \
        layout="wide"
    )
    
    #Colunas necessárias
    selected_columns_num = ['Administrative', 'Administrative_Duration', 'Informational','Informational_Duration', 'ProductRelated', 'ProductRelated_Duration', 'SpecialDay']
    selected_columns_cat = ['Month', 'Weekend']
    selected_columns = selected_columns_num + selected_columns_cat
    
    # Texto de introdução
    st.markdown('''
        # Projeto de Clusterização
        
        Neste exercício vamos usar a base [online shoppers purchase intention](https://archive.ics.uci.edu/ml/datasets/Online+Shoppers+Purchasing+Intention+Dataset) de Sakar, C.O., Polat, S.O., Katircioglu, M. et al. Neural Comput & Applic (2018). [Web Link](https://doi.org/10.1007/s00521-018-3523-0).

        A base trata de registros de 12.330 sessões de acesso a páginas, cada sessão sendo de um único usuário em um período de 12 meses, para posteriormente estudarmos a relação entre o design da página e o perfil do cliente - "Será que clientes com comportamento de navegação diferentes possuem propensão a compra diferente?" 

        Nosso objetivo é agrupar as sessões de acesso ao portal considerando as informações fornecidas no dataset.
        ''')
    
    #Carregando CSV
    with st.form("my_form"):
        col1, col2 = st.columns(2)
        with col1:
            df_raw = carregar_dataset(selected_columns)
        with col2:
            n_clusters = st.number_input('Número de Clusters a serem formados', min_value=2, max_value=10, step=1, value=3)
        
        st.form_submit_button("Gerar Clusters")
    
    # Verifica se há conteúdo carregado e se as colunas são as corretas
    if df_raw is not None and df_raw is not False:
        
        tab_raw, tab_analise_num, tab_analise_cat, tab_clustering = st.tabs(["💾 Dados Raw", "🔢 Analise Descritiva - Numerico", "🔠 Analise Descritiva - Categórico", "🏷️ Clustering"])

        with tab_raw:
            df_raw

        with tab_analise_num:

            st.dataframe(df_raw[selected_columns_num].describe().T, use_container_width=True)

            cols = st.columns(2)
            for i in range(len(selected_columns_num)):
                with cols[i%2]:
                    fig = px.histogram(df_raw, x=selected_columns_num[i], marginal="box", hover_data=df_raw.columns)
                    fig.update_layout(title={
                        'text': f"Distribuição coluna {selected_columns_num[i]}",
                        'x': 0.1
                        })
                    st.plotly_chart(fig, use_container_width=True)

        with tab_analise_cat:
            
            st.dataframe(df_raw[selected_columns_cat].describe().T, use_container_width=True)
            
            cols = st.columns(2)
            for i in range(len(selected_columns_cat)):
                with cols[i%2]:
                    fig = px.histogram(df_raw, x=selected_columns_cat[i], marginal="box", color_discrete_sequence=['indianred'], text_auto=True)
                    fig.update_layout(title={
                        'text': f"Distribuição coluna {selected_columns_cat[i]}",
                        'x': 0.1
                        })
                    st.plotly_chart(fig, use_container_width=True)
            
        with tab_clustering:
            
            df_cat_norm = pd.DataFrame(Normalizer().fit_transform(df_raw[selected_columns_num]), columns = selected_columns_num)
            df_num_dummie = pd.get_dummies(df_raw[selected_columns_cat])
            df_trans = pd.concat([df_cat_norm, df_num_dummie], axis=1)
            
            km_cluster = KMeans(n_clusters=n_clusters, random_state=42)
            km_cluster.fit(df_trans)
            
            nomes_grupos = ['G' + str(g+1) for g in range(n_clusters)]
            df_raw['cluster'] = pd.Categorical.from_codes(km_cluster.labels_, categories = nomes_grupos).astype('category')
            df_trans['cluster'] = pd.Categorical.from_codes(km_cluster.labels_, categories = nomes_grupos).astype('category')
            
            col1, col2 = st.columns([2,10])
            
            with col1:
                n_df = df_raw.groupby('cluster').count()\
                                                .iloc[:,0]\
                                                .rename('Número de Registros')\
                                                .to_frame()\
                                                .reset_index()\
                                                .rename(columns={'cluster': 'Clusters'})
                
                fig = px.pie(n_df, values='Número de Registros', names='Clusters', title='Distribuição dos clusters')
                st.plotly_chart(fig, use_container_width=True)
            
            with col2:

                df_heat = df_trans.groupby('cluster').mean().round(2)
                fig = px.imshow(df_heat, text_auto=True, aspect="auto", title='Heatmap dos clusters - Valores Médios (Normalizados)')
                st.plotly_chart(fig, use_container_width=True)




            
                
            
            
    # O dataset não possui as features necessárias (retornou False)
    elif df_raw is False:
        st.warning('Você enviou um dataset com colunas que não são as necessárias para o agrupamento. Verifique abaixo as colunas necessárias', icon="⚠️")
        with st.expander("Colunas necessárias para o Agrupamento"):
            st.write(selected_columns)
    return True


if __name__ == '__main__':
	main()