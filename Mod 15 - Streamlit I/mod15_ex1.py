import streamlit as st
import pandas as pd
import plotly.express as px

def plot_graph(df, values = 'IDADEMAE', index = 'DTNASC', aggfunc = 'mean'):
    df_aux = pd.pivot_table(df, values=values, index=index,
                       aggfunc=aggfunc).reset_index()
    
    fig = px.line(df_aux, x=index, y=values)
    st.plotly_chart(fig)
    return None

st.set_page_config(page_title='SINASC Rondônia', page_icon='👶', layout='wide', initial_sidebar_state='auto')

"# Análise SINASC"

df = pd.read_csv('./data/SINASC_RO_2019.csv')
df['DTNASC'] = pd.to_datetime(df['DTNASC'])


date_start = st.sidebar.date_input('Data Inicial',
    value = df['DTNASC'].min(),
    min_value = df['DTNASC'].min(),
    max_value = df['DTNASC'].max(),
)


date_end = st.sidebar.date_input('Data Final',
    value = df['DTNASC'].max(),
    min_value = df['DTNASC'].min(),
    max_value = df['DTNASC'].max(),
)


axis_y = st.sidebar.selectbox('Eixo Y', options = df.select_dtypes(include=['int64', 'float64']).columns)

agg_func = st.sidebar.selectbox('Agg Function',options = ['mean', 'median', 'count'])

filter = (df['DTNASC'] >= pd.to_datetime(date_start)) & (df['DTNASC'] <= pd.to_datetime(date_end))
df_aux = df[filter]


plot_graph(df_aux, values=axis_y, aggfunc=agg_func)

columns = ['DTNASC', axis_y]
st.dataframe(df_aux[columns], use_container_width=True)
