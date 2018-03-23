// TRABALHO : LOCADORA OXY
// DISCIPLINA : PROGRAMAÇÃO IMPERATIVA
// PROF.: LAURO BARRETO FONTES
// ALUNO : CAIO VINÍCIUS MENESES SILVA
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Program project1 ;
uses
 crt;

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


//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// DECLARAÇÃO DAS VARAIAVEIS GLOBAIS

	var

	vet_cliente : array [1..100] of REG_CLIENTE;
	vet_funcionario : array [1..10] of REG_FUNCIONARIO;
	vet_filme : array [1..1000] of REG_FILME;
	opcao, cont_cli, cont_fun, cont_fil, cont_alu : integer;

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//DECLARAÇÃO DOS PROCEDIMENTOS

   procedure CADASTRAR_CLIENTE;
   var
   i   : integer;
   confirma : char;
   achou : boolean;

  begin
  	clrscr;
  	repeat
	write ('Informe o código do cliente :');
	repeat
	     achou := false ;
	     readln (vet_cliente[cont_cli].codigo);
	     for i := 1 to cont_cli do
	     	if i <> cont_cli then
	     		if vet_cliente[i].codigo = vet_cliente[cont_cli].codigo then
	     		achou := true;
	     	if achou = true then
	     		write ('Código ja cadastrado!, informe um codigo diferente :');
		until achou = false;
	  	write ('Informe o nome :');
	        readln (vet_cliente[i].nome);
		write ('Informe o endereço :');
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
                readln (confirma);
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
		writeln('Cliente nao cadastrado') ;
	 if condicao = true then
		begin
		 cont_cli := cont_cli - 1 ;
		 write('Dados do cliente foram excluidos com sucesso') ;
		end;
        write ('Deseja excluir outro cliente (S/N)?');
          readln (confirma);
           confirma := upcase (confirma);
		 cont_fun := cont_fun+1;
		clrscr;
		until confirma = 'N';
                clrscr ;
  end ;

  procedure CONSULTAR_CLIENTE;

   var
   i, cod : integer;

   begin
        repeat
              writeln ('Informe um código para consultar um cliente :');
              readln (cod);
                     for i := 1 to cont_cli do
                         if vet_cliente[i] = cod then
	                 write (vet_cliente[i].nome);
		         write (vet_cliente[i].endereco);
		         write (vet_cliente[i].telefone);
		         write (vet_cliente[i].dep1);
		         write (vet_cliente[i].dep2);
		         write (vet_cliente[i].dep3);
		         write ('Deseja cadastrar outro cliente (S/N)?');
                         readln (confirma);
                          confirma := upcase (confirma);
		           cont_cli := cont_cli + 1;
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
		     write ('Código ja cadastrado!, informe um codigo diferente :');
		until achou = false;
          write ('Informe o nome :');
	     readln (vet_funcionario[i].nome);
		write ('Informe o endereco :');
          readln (vet_funcionario[i].endereco);
          write ('Deseja cadastrar outro funcionario (S/N)?');
          readln (confirma);
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
		writeln('Funcionário não cadastrado') ;
	 if condicao = true then
		begin
		 cont_fun := cont_fun - 1 ;
		 write('Dados do funcionario foram excluidos com sucesso') ;
		end;
        write ('Deseja excluir outro funcionario (S/N)?');
          readln (confirma);
           confirma := upcase (confirma);
		 cont_fun := cont_fun+1;
		clrscr;
		until confirma = 'N';
                clrscr ;
  end ;

  procedure CADASTRAR_FILME;
   var
   i : integer;
   Achou : boolean;
   confirma : char;

   begin
   	repeat
   	clrscr;
  	write ('Informe o código do filme :');
	repeat
		achou := false ;
		readln (vet_filme[cont_fil].codigo);
		for i := 1 to cont_fil do
			if i <> cont_fil then
		     	if vet_filme[i].codigo = vet_filme[cont_fil].codigo then
		     	achou := true;
		if achou = true then
		     write ('Codigo ja cadastrado!, informe um codigo diferente :');
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
           	 readln (confirma);
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
   write ('Digite um código para excluir um filme :');
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
  	 if j = cont_cli then
		writeln('Filme nao cadastrado') ;
	 if condicao = true then
		begin
		 cont_cli := cont_cli - 1 ;
		 write('Dados do filme foram excluidos com sucesso') ;
		end;
        write ('Deseja excluir outro filme (S/N)?');
          readln (confirma);
           confirma := upcase (confirma);
		 cont_fun := cont_fun+1;
		clrscr;
		until confirma = 'N';
                clrscr ;
  end ;

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
	writeln('               2: FUNCIONÁRIO  ');
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
	writeln('               4: VOLTAR AO MENU ANTERIOR ');
	writeln;
     write('               ENTRE COM A OPCAO DESEJADA : ');
     readln(opcao);

     clrscr;
     case opcao of
		1: CONSULTAR_CLIENTE;
		//2: ;
		//3: ;
  end;
   until (opcao = 4);
  end;



//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  Begin
  	cont_cli := 1;
	cont_fun := 1;
	cont_fil := 1;
	cont_alu := 1;
	repeat
     clrscr;
     gotoxy(30,3);
	writeln('LOCADORA OXY');
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
        readln(opcao);

     clrscr;
     case opcao of
		1: SUB_MENU_INSERIR;
		2: SUB_MENU_EXCLUIR;
		//3:
		//4:
     end;
     until (opcao = 7);
	End.




