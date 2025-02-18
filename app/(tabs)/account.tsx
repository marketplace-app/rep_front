import React, { useEffect, useState } from 'react';
import { View, ActivityIndicator } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import LoginAccount from '../../components/view/LoginAccount';  // Importando a tela de Login
import DataAccount from '../../components/view/DataAccount';  // Importando a tela de Dados

export default function AccountScreen() {
  const [isLoggedIn, setIsLoggedIn] = useState<boolean | null>(null);  // Estado para controlar o login
  const [loading, setLoading] = useState(true);  // Estado para controlar o carregamento
  const [userData, setUserData] = useState(null);  // Estado para armazenar os dados do usuário

  useEffect(() => {
    const checkLoginStatus = async () => {
      try {
        // Tentando recuperar o token do AsyncStorage
        const userToken = await AsyncStorage.getItem('userToken');
        if (userToken && userToken.length > 0) {
          // Se o token for válido, vamos buscar os dados do usuário
          const response = await fetch('http://192.168.1.248:8000/api/home/', {
            method: 'GET',  // Método de requisição
            headers: {
              'Authorization': `Bearer ${userToken}`,  // Passa o token no cabeçalho da requisição
              'Content-Type': 'application/json',  // Especifica que estamos enviando e esperando JSON
            },
          });

          if (response.ok) {
            const data = await response.json();  // Converte a resposta para JSON
            setUserData(data);  // Armazena os dados do usuário na variável de estado
            setIsLoggedIn(true);  // Marca o usuário como logado
          } else {
            setIsLoggedIn(false);  // Caso a API não retorne uma resposta válida
          }
        } else {
          setIsLoggedIn(false);  // Se o token for nulo ou vazio, o usuário não está logado
        }
      } catch (error) {
        console.error('Erro ao verificar o status de login ou buscar dados:', error);
        setIsLoggedIn(false);  // Em caso de erro, assume que o usuário não está logado
      } finally {
        setLoading(false);  // Terminou a verificação e a busca, pode parar o carregamento
      }
    };

    checkLoginStatus();  // Chama a função de verificação quando o componente monta
  }, []);

  if (loading) {
    return (
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <ActivityIndicator size="large" color="#0000ff" />
      </View>
    );  // Mostra um carregando enquanto verifica o status
  }

  return (
    <View style={{ flex: 1 }}>
      {isLoggedIn && userData ? (
        <DataAccount/>  // Passa os dados do usuário para o componente DataAccount
      ) : (
        <LoginAccount />
      )}
    </View>
  );
}
