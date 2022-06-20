

import psycopg2


def remove_customer_by_cpf(cpf):

    cpf_formatado = cpf[:3] + "." + cpf[3:6] + "." + cpf[6:9] + "-" + cpf[9:]

    conn = psycopg2.connect(
        host='zepalheta-postgres',
        database='zepalheta',
        user='postgres',
        password='qaninja'
    )

    query = "delete from public.customers WHERE cpf = '{}';".format(cpf_formatado)
    print(query)

    cur = conn.cursor()

    cur.execute(query)

    conn.commit()

    cur.close()
    conn.close()