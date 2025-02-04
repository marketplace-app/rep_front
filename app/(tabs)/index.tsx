import React from 'react';
import { StyleSheet, View, Text, ScrollView } from 'react-native';
import Card from '../../components/ui/card'; // Importe o componente do card

export default function Inicio({ navigation }) {
  const imoveis = [
    {
      foto: 'https://example.com/imagem1.jpg', // Substitua com a URL da imagem
      titulo: 'Casa 1',
      localizacao: 'Localização 1',
      preco: '1.500,00',
    },
    {
      foto: 'https://example.com/imagem2.jpg', // Substitua com a URL da imagem
      titulo: 'Casa 2',
      localizacao: 'Localização 2',
      preco: '2.000,00',
    },
    // Adicione mais imóveis aqui
  ];

  return (
    <ScrollView style={styles.container}>
      {imoveis.map((imovel, index) => (
        <Card
          key={index}
          navigation={navigation}
          foto={imovel.foto}
          titulo={imovel.titulo}
          localizacao={imovel.localizacao}
          preco={imovel.preco}
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
