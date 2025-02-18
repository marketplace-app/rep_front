import React, { useEffect, useState } from 'react';
import { StyleSheet, View, Text, ScrollView, Image } from 'react-native';
import Card from '../../components/ui/card'; // Importe o componente do card

export default function ListPropertiesUser() {
  const [imoveis, setImoveis] = useState<any[]>([]); // Armazenar imóveis
  const [loading, setLoading] = useState<boolean>(true); // Estado de carregamento

  const fetchImoveis = async () => {
    try {
      const response = await fetch('http://192.168.1.248:8000/api/imoveis');
      
      if (!response.ok) {
        throw new Error(`Erro na requisição: ${response.status} - ${response.statusText}`);
      }
      const contentType = response.headers.get("Content-Type");
      if (!contentType || !contentType.includes("application/json")) {
        throw new Error("A resposta não é um JSON válido.");
      }
      const data = await response.json(); 
      console.log(data.results); 
  
      setImoveis(data.results); 
    } catch (error) {
      console.error("Erro ao buscar imóveis:", error);
    } finally {
      setLoading(false); 
    }
  };
  useEffect(() => {
    fetchImoveis(); 
  }, []);

  if (loading) {
    return <Text>Carregando...</Text>; 
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
