import React, { useEffect, useState } from 'react';
import { StyleSheet, View, Text, ScrollView, Image } from 'react-native';
import Card from '../../components/ui/card'; // Importe o componente do card

export default function ListProperties() {
  const [imoveis, setImoveis] = useState<any[]>([]); // Armazenar imóveis
  const [loading, setLoading] = useState<boolean>(true); // Estado de carregamento

  const fetchImoveis = async () => {
    try {
      const response = await fetch('http://192.168.1.248:8000/api/imoveis');
      
      if (!response.ok) {
        throw new Error(`Erro na requisição: ${response.status} - ${response.statusText}`);
      }
  
      // Verifique o tipo de conteúdo retornado pela API
      const contentType = response.headers.get("Content-Type");
      if (!contentType || !contentType.includes("application/json")) {
        throw new Error("A resposta não é um JSON válido.");
      }
      const data = await response.json(); // Aqui tentamos parsear a resposta como JSON
      console.log(data.results); // Exibe os dados no console
  
      setImoveis(data.results); // Atualiza os imóveis com o retorno da API
    } catch (error) {
      console.error("Erro ao buscar imóveis:", error);
    } finally {
      setLoading(false); // Finaliza o carregamento
    }
  };
  useEffect(() => {
    fetchImoveis(); // Chama a função de busca quando o componente é montado
  }, []);

  if (loading) {
    return <Text>Carregando...</Text>; // Exibe carregando enquanto os dados não chegam
  }

  return (
    <ScrollView style={styles.container}>
      {imoveis.map((imovel, index) => (
        <Card
          key={index}
          foto={imovel.imagens[0]} // A primeira imagem do imóvel
          titulo={imovel.descricao} // Descrição do imóvel
          localizacao={imovel.endereco} // Endereço do imóvel
          preco={imovel.valor} // Valor do imóvel
        />
      ))}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 10,
    backgroundColor: '#f4f4f4',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
    color: '#333',
  },
});
