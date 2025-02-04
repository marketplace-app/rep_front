import React, { useState } from 'react';
import { StyleSheet, View, Text, TextInput, Button, TouchableOpacity, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

import { NativeStackNavigationProp } from '@react-navigation/native-stack';

type RootStackParamList = {
  Home: undefined;
  Cadastro: undefined;
};

type LoginAccountNavigationProp = NativeStackNavigationProp<RootStackParamList, 'Home'>;

interface LoginAccountProps {
  navigation: LoginAccountNavigationProp;
}

const LoginAccount: React.FC<LoginAccountProps> = ({ navigation }) => {
  const [email, setEmail] = useState('');
  const [senha, setSenha] = useState('');

  // Função para login com e-mail e senha usando fetch
  const loginComEmailSenha = async () => {
    try {
      // Substitua pela URL da sua API de login
      const response = await fetch('http://192.168.3.4:8000/apt/token', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          email,
          senha,
        }),
      });

      if (!response.ok) {
        throw new Error('Falha ao fazer login');
      }

      const data = await response.json();
      const userToken = data.token; // Supondo que a resposta da API tenha um campo `token`
      await AsyncStorage.setItem('userToken', userToken); // Salvando o token no AsyncStorage

      Alert.alert('Login', 'Login realizado com sucesso!');
      navigation.navigate('Home'); // Navegar para a tela Home após login bem-sucedido
    } catch (error) {
      console.error(error);
      Alert.alert('Erro', 'Falha ao fazer login. Verifique seus dados e tente novamente.');
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Login</Text>

      {/* Campo de e-mail */}
      <TextInput
        style={styles.input}
        placeholder="Usuário"
        value={email}
        onChangeText={setEmail}
        keyboardType="email-address"
        autoCapitalize="none"
      />

      {/* Campo de senha */}
      <TextInput
        style={styles.input}
        placeholder="Senha"
        value={senha}
        onChangeText={setSenha}
        secureTextEntry
      />

      {/* Botão Entrar */}
      <Button title="Entrar" onPress={loginComEmailSenha} />

      {/* Links para outras opções */}
      <View style={styles.linksContainer}>
        <TouchableOpacity onPress={() => Alert.alert('Recuperar Senha')}>
          <Text style={styles.link}>Esqueceu a senha?</Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={() => navigation.navigate('Cadastro')}>
          <Text style={styles.link}>Cadastrar-se</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
};

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
    marginBottom: 30,
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
  linksContainer: {
    justifyContent: 'space-between',
    width: '100%',
    marginBottom: 20,
    alignItems: 'center',
    gap: 4,
    marginTop: 10,
  },
  link: {
    color: '#007BFF',
    textDecorationLine: 'underline',
  },
});

export default LoginAccount;
