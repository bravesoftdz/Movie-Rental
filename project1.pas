// TRABALHO : LOCADORA OXY
// DISCIPLINA : PROGRAMAÇÃO IMPERATIVA
// PROF.: LAURO BARRETO FONTES
// ALUNO : CAIO VINÍCIUS MENESES SILVA
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Program project1 ;
uses
 crt, sysutils, Primeira;

// DECALARAÇÃO DOS REGISTROS
	type
	 REG_CLIENTE = record
	 codigo : integer;
	 nome, endereco, telefone, dep1, dep2, dep3 : string;
	end;

	 REG_FUNCIONARIO = record
	 codigo : integer;
	 nome, endereco : string;
	end;

	 REG_FILME = record
	 codigo, num_fitas : integer;
	 valor_aluguel : real;
	 nome, sinopse, ator_principal, categoria : string;
	end;

         REG_ALUGUEL = record
         cod_cli, cod_fun, cod_fil : integer;
         data_aluguel, data_devolucao : string;
         valor_aluguel : real;
         pago : char;
        end;


//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// DECLARAÇÃO DAS VARAIAVEIS GLOBAIS

	var

	vet_cliente : array [1..100] of REG_CLIENTE;
        arq_cliente : File of REG_CLIENTE;

	vet_funcionario : array [1..10] of REG_FUNCIONARIO;
        arq_funcionario : File of REG_FUNCIONARIO;

	vet_filme : array [1..1000] of REG_FILME;
        arq_filme : File of REG_FILME;

        vet_aluguel : array [1..1000] of REG_ALUGUEL;
        arq_aluguel : File of REG_ALUGUEL;

	i, opcao, cont_cli, cont_fun, cont_fil, cont_alu : integer;

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//DECLARAÇÃO DOS PROCEDIMENTOS


   procedure CADASTRAR_CLIENTE;
   var
   i   : integer;
   confirma : char;
   achou : boolean;

  begin
  repeat
	write ('Informe o codigo do cliente :');
	repeat
	     achou := false ;
	     readln (vet_cliente[cont_cli].codigo);
	     for i := 1 to cont_cli do
	     	if i <> cont_cli then
	     		if vet_cliente[i].codigo = vet_cliente[cont_cli].codigo then
	     		achou := true;
	     	if achou = true then
	     	   write ('Codigo ja cadastrado, informe um codigo diferente :');
		until achou = false;
	  	write ('Informe o nome :');
	        readln (vet_cliente[i].nome);
		write ('Informe o endereco :');
		readln (vet_cliente[i].endereco);
		write ('Informe o telefone :');
		readln (vet_cliente[i].telefone);
		write ('Informe o Dependente 1 :');
		readln (vet_cliente[i].dep1);
		write ('Informe o Dependente 2 :');
		readln (vet_cliente[i].dep2);
		write ('Informe o Dependente 3 :');
		readln (vet_cliente[i].dep3);
		write ('Deseja cadastrar outro cliente (S/N)?');
                read (confirma);
                 confirma := upcase (confirma);
		 cont_cli := cont_cli + 1;
		clrscr;
		until confirma = 'N';
		clrscr;
  end;

 procedure EXCLUIR_CLIENTE;
  var
  i, j, cod : integer;
  condicao : boolean;
  confirma : char;

  begin
   clrscr;
   repeat
   condicao := false;
   j := 0;
   write ('Digite um codigo para excluir um cliente :');
   readln (cod);
   	for i := 1 to cont_cli do
   	 if vet_cliente[i].codigo = cod then
   	  begin
   	  	vet_cliente[i].codigo := vet_cliente[cont_cli].codigo;
	        vet_cliente[i].nome := vet_cliente[cont_cli].nome;
		vet_cliente[i].endereco := vet_cliente[cont_cli].endereco;
		vet_cliente[i].telefone := vet_cliente[cont_cli].telefone;
		vet_cliente[i].dep1 := vet_cliente[cont_cli].dep1;
		vet_cliente[i].dep2 := vet_cliente[cont_cli].dep2;
		vet_cliente[i].dep3 := vet_cliente[cont_cli].dep3;
          condicao := true ;
         end
      else
	 j := j+1 ;
  	 if j = cont_cli then
		writeln('Cliente nao cadastrado !') ;
	 if condicao = true then
		begin
		 cont_cli := cont_cli - 1 ;
		 writeln('Dados do cliente foram excluidos com sucesso !') ;
		end;
        writeln ('Deseja excluir outro cliente (S/N)?');
          read (confirma);
           confirma := upcase (confirma);
		clrscr;
		until confirma = 'N';
                clrscr ;
  end ;

  procedure CONSULTAR_CLIENTE;

   var
   i,j, cod : integer;
   confirma : char;
   condicao : boolean;

   begin
        repeat
        condicao := false;
        j := 0;
              write ('Informe um codigo para consultar um cliente :');
              readln (cod);
                     for i := 1 to cont_cli do
                         if vet_cliente[i].codigo = cod then
                         begin
	                      writeln ('Nome :',vet_cliente[i].nome);
		              writeln ('Endereco :',vet_cliente[i].endereco);
		              writeln ('Telefone :',vet_cliente[i].telefone);
		              writeln ('Dep. 1 :',vet_cliente[i].dep1);
		              writeln ('Dep. 2 :',vet_cliente[i].dep2);
		              writeln ('Dep. 3 :',vet_cliente[i].dep3);
                              condicao := true;
                         end
                         else
                             j := j+1;
  	                     if j = cont_cli then
		                writeln('Cliente nao cadastrado !') ;
                         write ('Deseja consultar outro cliente (S/N)?');
                         read (confirma);
                          confirma := upcase (confirma);
	                 clrscr;
	until confirma = 'N';
		         clrscr;
   end;

  procedure CADASTRAR_FUNCIONARIO;
   var
   i : integer;
   confirma : char;
   achou : boolean;

  begin
  	clrscr;
  	repeat
  	write ('Informe o código do funcionario :');
	repeat
		achou := false ;
		readln (vet_funcionario[cont_fun].codigo);
		for i := 1 to cont_fun do
			if i <> cont_fun then
		     	if vet_funcionario[i].codigo = vet_funcionario[cont_fun].codigo then
		     	achou := true;
		if achou = true then
		     write ('Codigo ja cadastrado, informe um codigo diferente :');
		until achou = false;
          write ('Informe o nome :');
	     readln (vet_funcionario[i].nome);
		write ('Informe o endereco :');
          readln (vet_funcionario[i].endereco);
          write ('Deseja cadastrar outro funcionario (S/N)?');
          read (confirma);
           confirma := upcase (confirma);
		 cont_fun := cont_fun+1;
		clrscr;
		until confirma = 'N';
		clrscr;
  end;

  procedure EXCLUIR_FUNCIONARIO;
  var
  i, j, cod : integer;
  condicao : boolean;
  confirma : char;

  begin
   clrscr;
   repeat
   condicao := false;
   j := 0;
   write ('Digite um codigo para excluir um funcionario :');
   readln (cod);
   	for i := 1 to cont_fun do
   	 if vet_funcionario[i].codigo = cod then
   	  begin
   	  	vet_funcionario[i].codigo := vet_funcionario[cont_fun].codigo;
	        vet_funcionario[i].nome := vet_funcionario[cont_fun].nome;
		vet_funcionario[i].endereco := vet_funcionario[cont_fun].endereco;
          condicao := true ;
         end
      else
	 j := j+1 ;
  	 if j = cont_fun then
		writeln('Funcionario nao cadastrado !') ;
	 if condicao = true then
		begin
		 cont_fun := cont_fun - 1 ;
		 writeln ('Dados do funcionario foram excluidos com sucesso !') ;
		end;
        writeln ('Deseja excluir outro funcionario (S/N)?');
          read (confirma);
           confirma := upcase (confirma);
		clrscr;
		until confirma = 'N';
                clrscr ;
  end ;

  procedure CONSULTAR_FUNCIONARIO;

   var
   i, j, cod : integer;
   confirma : char;
   condicao : boolean;

   begin
        repeat
        j := 0;
        condicao := false;
              write ('Informe um codigo para consultar um funcionario :');
              readln (cod);
                     for i := 1 to cont_fun do
                         if vet_funcionario[i].codigo = cod then
                         begin
	                      writeln ('Nome :',vet_funcionario[i].nome);
		              writeln ('Endereco :',vet_funcionario[i].endereco);
                              condicao := true;
                         end
                         else
	                  j := j+1 ;
  	                    if j = cont_fun then
		             writeln('Funcionario nao cadastrado !') ;
                         writeln ('Deseja consultar outro funcionario (S/N)?');
                         read (confirma);
                          confirma := upcase (confirma);
	                 clrscr;
	until confirma = 'N';
		         clrscr;
   end;

  procedure CADASTRAR_FILME;
   var
   i : integer;
   Achou : boolean;
   confirma : char;

   begin
   	repeat
   	clrscr;
  	write ('Informe o codigo do filme :');
	repeat
		achou := false ;
		readln (vet_filme[cont_fil].codigo);
		for i := 1 to cont_fil do
			if i <> cont_fil then
		     	if vet_filme[i].codigo = vet_filme[cont_fil].codigo then
		     	achou := true;
		if achou = true then
		     write ('Codigo ja cadastrado, informe um codigo diferente :');
		until achou = false;
    	  		write ('Informe o nome :');
			readln (vet_filme[i].nome);
			write ('Informe a sinopse :');
			readln (vet_filme[i].sinopse);
			write ('Informe o ator principal :');
			readln (vet_filme[i].ator_principal);
			write ('Informe a categoria :');
			readln (vet_filme[i].categoria);
			write ('Informe a quantidade de fitas :');
			readln (vet_filme[i].num_fitas);
			write ('Informe o valor para aluguel :');
			readln (vet_filme[i].valor_aluguel);
			write ('Deseja cadastrar outro filme (S/N)?');
           	 read (confirma);
           	 confirma := upcase (confirma);
			 cont_fil := cont_fil + 1;
			clrscr;
        until confirma = 'N';
        clrscr;
   end;

   procedure EXCLUIR_FILME;
  var
  i, j, cod : integer;
  condicao : boolean;
  confirma : char;

  begin
   clrscr;
   repeat
   condicao := false;
   j := 0;
   write ('Digite um codigo para excluir um filme :');
   readln (cod);
   	for i := 1 to cont_fil do
   	 if vet_filme[i].codigo = cod then
   	  begin
   	  	vet_filme[i].codigo := vet_filme[cont_fil].codigo;
	        vet_filme[i].nome := vet_filme[cont_fil].nome;
		vet_filme[i].sinopse := vet_filme[cont_fil].sinopse;
		vet_filme[i].ator_principal := vet_filme[cont_fil].ator_principal;
		vet_filme[i].categoria := vet_filme[cont_fil].categoria;
		vet_filme[i].num_fitas := vet_filme[cont_fil].num_fitas;
		vet_filme[i].valor_aluguel := vet_filme[cont_fil].valor_aluguel;
          condicao := true ;
         end
      else
	 j := j+1 ;
  	 if j = cont_fil then
		writeln('Filme nao cadastrado !') ;
	 if condicao = true then
		begin
		 cont_fil := cont_fil - 1 ;
		 writeln('Dados do filme foram excluidos com sucesso !') ;
		end;
        writeln ('Deseja excluir outro filme (S/N)?');
          read (confirma);
           confirma := upcase (confirma);
		clrscr;
		until confirma = 'N';
                clrscr ;
  end ;

  procedure CONSULTAR_FILME;

   var
   i, j, cod : integer;
   condicao : boolean;
   confirma : char;

   begin
        repeat
        condicao := false;
              write ('Informe um codigo para consultar um filme :');
              readln (cod);
                     for i := 1 to cont_fil do
                         if vet_filme[i].codigo = cod then
                         begin
	                      writeln ('Nome :',vet_filme[i].nome);
                              writeln ('Sinopse :',vet_filme[i].sinopse);
		              writeln ('Ator Principal :',vet_filme[i].ator_principal);
		              writeln ('Categoria :',vet_filme[i].categoria);
		              writeln ('Numero de fitas :',vet_filme[i].num_fitas);
		              writeln ('Valor do aluguel :',vet_filme[i].valor_aluguel);
                              condicao := true;
                         end
                         else
	                 j := j+1 ;
  	                    if j = cont_fil then
		             writeln('Filme nao cadastrado !') ;
                         writeln ('Deseja consultar outro filme (S/N)?');
                         read (confirma);
                          confirma := upcase (confirma);
	                 clrscr;
	until confirma = 'N';
		         clrscr;
   end;


   procedure ALUGAR_FILME;
    var
    i : integer;
    data_aluguel, data_devolucao : string;
    confirma, pago : char;
    achou : boolean;

   begin
        repeat
             for i := 1 to cont_alu do
             write ('Informe o codigo do cliente :');
             readln (vet_aluguel[i].cod_cli);
             write ('Informe o codigo do funcionario :');
             readln (vet_aluguel[i].cod_fun);
             write ('Informe o codigo do filme :');
             readln (vet_aluguel[i].cod_fil);
               vet_aluguel[i].data_aluguel := FormatDateTime('c', Now);
             writeln ('Data do aluguel : ',vet_aluguel[i].data_aluguel);
                     repeat
                           write ('Informe a data de devolucao :');
                           readln (vet_aluguel[i].data_devolucao);
                            if vet_aluguel[i].data_aluguel > vet_aluguel[i].data_devolucao then
                            write ('Data invalida !');
                    until vet_aluguel[i].data_aluguel < vet_aluguel[i].data_devolucao;
             write ('O filme ja foi pago (S/N)?');
             readln (vet_aluguel[i].pago);
             writeln ('Deseja inserir outro aluguel (S/N)?');
             read (confirma);
              confirma := upcase (confirma);
             cont_alu := (cont_alu + 1);
             vet_filme[i].num_fitas := vet_filme[i].num_fitas - 1;
	     clrscr;
	until confirma = 'N';
	      clrscr;
   end;


  procedure DEVOLVER_FILME;
    var
    i : integer;
    data_aluguel, data_devolucao : string;
    confirma, pago : char;
    achou : boolean;

   begin
        repeat
             for i := 1 to cont_alu do
             write ('Informe o codigo do filme :');
             readln (vet_aluguel[i].cod_fil);
             write ('Informe a data do aluguel :');
             readln (vet_aluguel[i].data_aluguel);
                     repeat
                           write ('Informe a data de devolucao :');
                           readln (vet_aluguel[i].data_devolucao);
                            if vet_aluguel[i].data_aluguel > vet_aluguel[i].data_devolucao then
                            write ('Data inválida !');
                    until vet_aluguel[i].data_aluguel < vet_aluguel[i].data_devolucao;
             writeln ('Deseja devolver outro filme (S/N)?');
             read (confirma);
              confirma := upcase (confirma);
             cont_alu := (cont_alu - 1);
             vet_filme[i].num_fitas := vet_filme[i].num_fitas + 1;
	     clrscr;
	until confirma = 'N';
	      clrscr;
   end;


  procedure CONSULTAR_ALUGUEL_CLIENTE;
   var
   i, j, cod : integer;
   condicao : boolean;
   confirma : char;

   begin
        repeat
        condicao := false;
        j := 0;
              write ('Informe o codigo do cliente para consultar um aluguel :');
              readln (cod);
                     for i := 1 to cont_alu do
                         if vet_aluguel[i].cod_cli = cod then
                         begin
	                      writeln ('Codigo do Cliente :',vet_aluguel[i].cod_cli);
                              writeln ('Codigo do Funcionario :',vet_aluguel[i].cod_fun);
		              writeln ('Codigo do Filme :',vet_aluguel[i].cod_fil);
		              writeln ('Data do Aluguel :',vet_aluguel[i].data_aluguel);
		              writeln ('Data da Devolucao :',vet_aluguel[i].data_devolucao);
		              writeln ('Pago (S/N)? :',vet_aluguel[i].pago);
                              condicao := true;
                         end
                         else
	                 j := j+1 ;
  	                    if j = cont_alu then
		             writeln('Aluguel nao cadastrado !') ;
                         writeln ('Deseja consultar outro aluguel (S/N)?');
                         read (confirma);
                          confirma := upcase (confirma);
	                 clrscr;
	until confirma = 'N';
		         clrscr;
   end;


  procedure CONSULTAR_ALUGUEL_FILME;
   var
   i, j, cod : integer;
   condicao : boolean;
   confirma : char;

   begin
        repeat
        condicao := false;
        j := 0;
              write ('Informe o codigo do filme para consultar um aluguel :');
              readln (cod);
                     for i := 1 to cont_alu do
                         if vet_aluguel[i].cod_fil = cod then
                         begin
	                      writeln ('Codigo do Cliente :',vet_aluguel[i].cod_cli);
                              writeln ('Codigo do Funcionario :',vet_aluguel[i].cod_fun);
		              writeln ('Codigo do Filme :',vet_aluguel[i].cod_fil);
		              writeln ('Data do Aluguel :',vet_aluguel[i].data_aluguel);
		              writeln ('Data da Devolucao :',vet_aluguel[i].data_devolucao);
		              writeln ('Pago :',vet_aluguel[i].pago);
                              condicao := true;
                         end
                         else
	                 j := j+1 ;
  	                    if j = cont_alu then
		             writeln('Aluguel nao cadastrado !') ;
                         writeln ('Deseja consultar outro aluguel (S/N)?');
                         read (confirma);
                          confirma := upcase (confirma);
	                 clrscr;
	until confirma = 'N';
		         clrscr;
   end;


  procedure CONSULTAR_ALUGUEL_DATA;
   var
   i, j, cod : integer;
   condicao : boolean;
   confirma : char;
   data_alu_aux : string;

   begin
        repeat
        condicao := false;
        j := 0;
              write ('Informe a data do aluguel para consulta-lo :');
              readln (data_alu_aux);
                     for i := 1 to cont_alu do
                         if vet_aluguel[i].data_aluguel = data_alu_aux then
                         begin
	                      writeln ('Codigo do Cliente :',vet_aluguel[i].cod_cli);
                              writeln ('Codigo do Funcionario :',vet_aluguel[i].cod_fun);
		              writeln ('Codigo do Filme :',vet_aluguel[i].cod_fil);
		              writeln ('Data do Aluguel :',vet_aluguel[i].data_aluguel);
		              writeln ('Data da Devolucao :',vet_aluguel[i].data_devolucao);
		              writeln ('Pago :',vet_aluguel[i].pago);
                              condicao := true;
                         end
                         else
	                 j := j+1 ;
  	                    if j = cont_alu then
		             writeln('Aluguel nao cadastrado !') ;
                         writeln ('Deseja consultar outro aluguel (S/N)?');
                         read (confirma);
                          confirma := upcase (confirma);
	                 clrscr;
	until confirma = 'N';
		         clrscr;
   end;


  procedure CONSULTAR_ALUGUEL;
   var
   opcao : integer;

  begin
   repeat
     clrscr;
     gotoxy(30,3);
	writeln('LOCADORA OXY');
     writeln;
	writeln;
	writeln('               1: CONSULTAR POR CODIGO DO CLIENTE  ');
	writeln('               2: CONSULTAR POR CODIGO DO FILME  ');
	writeln('               3: CONSULTAR PELA DATA DO ALUGUEL  ');
	writeln('               4: VOLTAR AO MENU ANTERIOR ');
	writeln;
     write('               ENTRE COM A OPCAO DESEJADA : ');
     readln(opcao);

     clrscr;
     case opcao of
		1: CONSULTAR_ALUGUEL_CLIENTE;
		2: CONSULTAR_ALUGUEL_FILME;
		3: CONSULTAR_ALUGUEL_DATA;
  end;
   until (opcao = 4);
  end;

  procedure SUB_MENU_INSERIR;
   var
   opcao : integer;

  begin
   repeat
     clrscr;
     gotoxy(30,3);
	writeln('LOCADORA OXY');
     writeln;
	writeln;
	writeln('               1: CLIENTE  ');
	writeln('               2: FUNCIONARIO  ');
	writeln('               3: FILME  ');
	writeln('               4: VOLTAR AO MENU ANTERIOR ');
	writeln;
     write('               ENTRE COM A OPCAO DESEJADA : ');
     readln(opcao);

     clrscr;
     case opcao of
		1: CADASTRAR_CLIENTE;
		2: CADASTRAR_FUNCIONARIO;
		3: CADASTRAR_FILME;

  end;
   until (opcao = 4);
  end;

  procedure SUB_MENU_EXCLUIR;
   var
   opcao : integer;

  begin
   repeat
     clrscr;
     gotoxy(30,3);
	writeln('LOCADORA OXY');
     writeln;
	writeln;
	writeln('               1: CLIENTE  ');
	writeln('               2: FUNCIONARIO  ');
	writeln('               3: FILME  ');
	writeln('               4: VOLTAR AO MENU ANTERIOR ');
	writeln;
     write('               ENTRE COM A OPCAO DESEJADA : ');
     readln(opcao);

     clrscr;
     case opcao of
		1: EXCLUIR_CLIENTE;
		2: EXCLUIR_FUNCIONARIO;
		3: EXCLUIR_FILME;
  end;
   until (opcao = 4);
  end;

  procedure SUB_MENU_CONSULTAR;
   var
   opcao : integer;

  begin
   repeat
     clrscr;
     gotoxy(30,3);
	writeln('LOCADORA OXY');
     writeln;
	writeln;
	writeln('               1: CLIENTE  ');
	writeln('               2: FUNCIONARIO  ');
	writeln('               3: FILME  ');
        writeln('               4: ALUGUEL  ');
	writeln('               5: VOLTAR AO MENU ANTERIOR ');
	writeln;
     write('               ENTRE COM A OPCAO DESEJADA : ');
     readln(opcao);

     clrscr;
     case opcao of
		1: CONSULTAR_CLIENTE;
		2: CONSULTAR_FUNCIONARIO;
		3: CONSULTAR_FILME;
                4: CONSULTAR_ALUGUEL;
  end;
   until (opcao = 5);
  end;



  procedure GRAVAR_EM_ARQUIVO;

   begin
   Assign(arq_cliente,'Cliente.dat');
      reset (arq_cliente);
       for i := 1 to (cont_cli - 1) do
       write (arq_cliente, vet_cliente[i]);
       close (arq_cliente);

     Assign(arq_funcionario,'Funcionario.dat');
      reset (arq_funcionario);
       for i := 1 to (cont_fun - 1) do
        write(arq_funcionario, vet_funcionario[i]);
        close (arq_funcionario);

     Assign(arq_filme,'Filme.dat');
      reset(arq_filme);
       for i := 1 to (cont_fil - 1) do
       write (arq_filme, vet_filme[i]);
       close (arq_filme);

     Assign(arq_aluguel,'Aluguel.dat');
      reset (arq_aluguel);
       for i := 1 to (cont_alu - 1) do
       write (arq_aluguel, vet_aluguel[i]);
       close (arq_aluguel);
   end;

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// PROGRAMA PRINCIPAL

  Begin
// LER ARQUIVOS (JOGA-LOS NO VETOR)

     // CLIENTE.DAT
     Assign(arq_cliente,'Cliente.dat');
     Reset (arq_cliente);
     i := 0;
           while not Eof (arq_cliente) do
           begin
           inc (i);
           Read (arq_cliente, vet_cliente[i]);
           end;
     Close (arq_cliente);

     // FUNCIONARIO.DAT
     Assign(arq_funcionario,'Funcionario.dat');
     Reset (arq_funcionario);
     i := 0;
           while not Eof (arq_funcionario) do
           begin
           inc (i);
           Read (arq_funcionario, vet_funcionario[i]);
           end;
     Close (arq_funcionario);

     //FILME.DAT
     Assign(arq_filme,'Filme.dat');
     Reset (arq_filme);
     i := 0;
           while not Eof (arq_filme) do
           begin
           inc (i);
           Read (arq_filme, vet_filme[i]);
           end;
     Close (arq_filme);

     //ALUGUEL.DAT
     Assign(arq_aluguel,'Aluguel.dat');
     Reset (arq_aluguel);
     i := 0;
           while not Eof (arq_aluguel) do
           begin
           inc (i);
           Read (arq_aluguel, vet_aluguel[i]);
           end;
     Close (arq_aluguel);

     // INICIALIZANDO OS CONTADORES
     cont_cli := 0;
     cont_fun := 0;
     cont_fil := 0;
     cont_alu := 0;

     // MENU PRINICPAL
     repeat
     clrscr;
     gotoxy(30,2);
	writeln('LOCADORA OXY');
        writeln;
        writeln ('               CLIENTES: ',cont_cli,' / FUNCIONARIOS: ',cont_fun,' / FILMES: ',cont_fil,' / ALUGUEIS: ',cont_alu);
        writeln;
	writeln;
	writeln('               1: INSERIR  ');
	writeln('               2: EXCLUIR  ');
	writeln('               3: CONSULTAR  ');
	writeln('               4: ALUGAR FILME ');
	writeln('               5: DEVOLVER FILME ');
	writeln('               6: RELATORIO DE FATURAMENTO ');
	writeln('               7: SAIR ');
	writeln;
        write('                 ENTRE COM A OPCAO DESEJADA :');
        read(opcao);





     clrscr;
     case opcao of
		1: SUB_MENU_INSERIR;
		2: SUB_MENU_EXCLUIR;
		3: SUB_MENU_CONSULTAR;
		4: ALUGAR_FILME;
                5: DEVOLVER_FILME;
                7: GRAVAR_EM_ARQUIVO;


     end;
     until (opcao = 7);


	End.
 //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 // FIM DO PROGRAMA

