import React from 'react';
import { StyleSheet, Image, View, Text, TouchableOpacity } from 'react-native';
import { NativeStackNavigationProp } from '@react-navigation/native-stack';

type RootStackParamList = {
  DetalhesImovel: { foto: string; titulo: string; localizacao: string; preco: number };
};

type ComponenteNavigationProp = NativeStackNavigationProp<RootStackParamList, 'DetalhesImovel'>;

interface ComponenteProps {
  navigation: ComponenteNavigationProp;
  foto: string;
  titulo: string;
  localizacao: string;
  preco: number;
}

const Componente: React.FC<ComponenteProps> = ({ navigation, foto, titulo, localizacao, preco }) => {
  return (
    <TouchableOpacity
      style={styles.card}
      onPress={() => navigation.navigate('DetalhesImovel', { foto, titulo, localizacao, preco })} // Passando os dados para a próxima tela
    >
      <Image
        source={{ uri: foto }} // A foto será passada como uma prop
        style={styles.image}
      />
      <View style={styles.textContainer}>
        <Text style={styles.title}>{titulo}</Text> {/* Título do imóvel */}
        <Text style={styles.location}>{localizacao}</Text> {/* Localização do imóvel */}
        <View style={styles.priceContainer}>
          <Text style={styles.price}>R$ {preco}</Text> {/* Preço do imóvel */}
          <TouchableOpacity style={styles.reserveButton}>
            <Text style={styles.reserveButtonText}>Reservar</Text>
          </TouchableOpacity>
        </View>
      </View>
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  card: {
    flexDirection: 'row',
    backgroundColor: '#fff',
    borderRadius: 10,
    marginBottom: 15,
    padding: 10,
    shadowColor: '#000',
    shadowOpacity: 0.1,
    shadowRadius: 5,
    elevation: 3,
  },
  image: {
    width: 100,
    height: 100,
    borderRadius: 10,
  },
  textContainer: {
    marginLeft: 10,
    flex: 1,
    justifyContent: 'space-between',
  },
  title: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#333',
  },
  location: {
    fontSize: 14,
    color: '#666',
  },
  priceContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    marginTop: 10,
  },
  price: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#333',
  },
  reserveButton: {
    backgroundColor: '#007BFF',
    paddingVertical: 5,
    paddingHorizontal: 15,
    borderRadius: 5,
  },
  reserveButtonText: {
    color: '#fff',
    fontWeight: 'bold',
  },
});

export default Componente;
