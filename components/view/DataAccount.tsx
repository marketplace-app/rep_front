import React, { useState, useEffect } from 'react';
import { StyleSheet, View, Text, Button, TextInput, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';  // Importando AsyncStorage
import { NativeStackNavigationProp } from '@react-navigation/native-stack';

type RootStackParamList = {
  Home: undefined;
  Login: undefined;
  Cadastro: undefined;
};

type DataAccountNavigationProp = NativeStackNavigationProp<RootStackParamList, 'Home'>;

interface DataAccountProps {
  navigation: DataAccountNavigationProp;
}

export default function DataAccount({ navigation }: DataAccountProps) {
  // Simulando dados do usuário
  const [nome, setNome] = useState('');
  const [email, setEmail] = useState('joao.silva@example.com');
  const [novoNome, setNovoNome] = useState(nome);
  const [novoEmail, setNovoEmail] = useState(email);

  // Função para atualizar os dados da conta (simulação)
  const atualizarDados = () => {
    if (!novoNome || !novoEmail) {
      Alert.alert('Erro', 'Por favor, preencha todos os campos');
      return;
    }

    // Aqui você pode fazer uma chamada para a API para atualizar os dados do usuário
    setNome(novoNome);
    setEmail(novoEmail);
    Alert.alert('Sucesso', 'Dados atualizados com sucesso!');
  };

  // Função para sair do sistema
  const sairDoSistema = async () => {
    try {
      await AsyncStorage.get
      await AsyncStorage.removeItem('userToken');  // Removendo o token
      Alert.alert('Sucesso', 'Você saiu do sistema');
      navigation.navigate('account');  // Navegar de volta para a tela de login
    } catch (error) {
      console.error('Erro ao sair do sistema', error);
      Alert.alert('Erro', 'Houve um problema ao tentar sair.');
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Dados da Conta</Text>

      {/* Exibindo os dados atuais do usuário */}
      <View style={styles.dataContainer}>
        <Text style={styles.label}>Nome:</Text>
        <TextInput
          style={styles.input}
          value={novoNome}
          onChangeText={setNovoNome}
        />

        <Text style={styles.label}>E-mail:</Text>
        <TextInput
          style={styles.input}
          value={novoEmail}
          onChangeText={setNovoEmail}
          keyboardType="email-address"
        />
      </View>

      {/* Botão para atualizar os dados */}
      <Button title="Atualizar Dados" onPress={atualizarDados} />

      {/* Botão para sair do sistema */}
      <Button title="Sair" onPress={sairDoSistema} />

      {/* Link para voltar à tela principal */}
      <Button
        title="Voltar"
        onPress={() => {
          // Lógica para navegar para a tela anterior (ou principal)
          // navigation.goBack(); // Se estiver usando navegação com react-navigation
          Alert.alert('Navegação', 'Aqui você pode navegar para outra tela.');
        }}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
    backgroundColor: '#f4f4f4',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
  },
  dataContainer: {
    width: '100%',
    marginBottom: 20,
  },
  label: {
    fontSize: 16,
    marginBottom: 5,
    color: '#333',
  },
  input: {
    width: '100%',
    height: 40,
    borderColor: '#ccc',
    borderWidth: 1,
    borderRadius: 5,
    marginBottom: 15,
    paddingLeft: 10,
  },
});
