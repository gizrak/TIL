from datetime import datetime
from airflow import DAG
from airflow.operators.dummy import DummyOperator
from airflow.operators.python import PythonOperator
from airflow.utils.task_group import TaskGroup

def print_hello(name):
    return "Hello world ${name}!"

with DAG(
    dag_id='hello_world', 
    description='Hello World DAG',
    schedule_interval='0 12 * * *',
    start_date=datetime(2023, 1, 28), 
    catchup=False
):
    start = DummyOperator(task_id="start")
    end = DummyOperator(task_id="end")

    with TaskGroup(group_id="group1", tooltip="Tasks for group1") as group1:
        task1 = DummyOperator(task_id='task1')
        task2 = PythonOperator(task_id='task2', python_callable=print_hello, op_kwargs={'name': 'Ted'})
        task3 = PythonOperator(task_id='task3', python_callable=print_hello, op_kwargs={'name': 'Jane'})
        task4 = DummyOperator(task_id='task4')

        task1 >> [task2, task3] >> task4

    start >> group1 >> end
