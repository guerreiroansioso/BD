SELECT g.salario INTO salario_gerente
    FROM empresa.empregado g, empresa.departamento d
    WHERE g.rg_num = d.rg_num_ger AND g.rg_org_exp = d.rg_org_exp_ger
        AND d.num = NEW.dept_num_pertence
        -- Para camparar salario_gerente com NEW.salario.


-- Atualizando o salário de um gerente ou alterando o gerente de um dept.
SELECT COALESCE(MAX(e.salario), 0) INTO max_salario
    FROM empresa.empregado e
    WHERE e.dept_num_pertence = NEW.dept_num_pertence
        e.dept_num_pertence = (SELECT dnum FROM empresa.departamento d
                WHERE d.rg_num_ger = NEW.rg_num AND d.rg_org_exp_ger = NEW.rg_org_exp)