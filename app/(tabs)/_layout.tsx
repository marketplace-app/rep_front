import { Tabs } from 'expo-router';
import React, { useState } from 'react';
import { Platform, View, TextInput, TouchableOpacity, Text } from 'react-native';

import { HapticTab } from '@/components/HapticTab';
import { IconSymbol } from '@/components/ui/IconSymbol';
import { Colors } from '@/constants/Colors';
import { useColorScheme } from '@/hooks/useColorScheme';

export default function TabLayout() {
  const colorScheme = useColorScheme();
  const [searchText, setSearchText] = useState(''); // Para gerenciar o texto do campo de pesquisa

  // Defina a cor do texto dependendo do esquema de cores do dispositivo
  const textColor = Colors[colorScheme ?? 'light'].text || '#000'; // Garantir uma cor de texto
  const inputBackgroundColor = Colors[colorScheme ?? 'light'].background || '#f0f0f0'; // Cor de fundo do input
  const placeholderTextColor = Colors[colorScheme ?? 'light'].text || '#999'; // Cor do placeholder

  return (
    <View style={{ flex: 1 }}>
      <Tabs
        screenOptions={{
          tabBarActiveTintColor: Colors[colorScheme ?? 'light'].tint,
          headerShown: true, // Exibir cabeçalho
          headerStyle: { backgroundColor: Colors[colorScheme ?? 'light'].background },
          headerTitleAlign: 'center', // Centraliza o título
          headerTitle: () => (
            <View style={{ flexDirection: 'row', justifyContent: 'center', alignItems: 'center', width: '100%' }}>
              <View
                style={{
                  flexDirection: 'row',
                  alignItems: 'center',
                  backgroundColor: inputBackgroundColor,
                  borderRadius: 5,
                  paddingLeft: 10,
                  gap:5,
                  width: '100%', // O campo de pesquisa ocupará 80% da largura
                }}
              >
                <TextInput
                  style={{
                    height: 40,
                    width: '85%', // O campo de pesquisa ocupará 90% do espaço dentro do container
                    borderColor: Colors[colorScheme ?? 'light'].tint,
                    borderWidth: 1,
                    borderRadius: 5,
                    paddingLeft: 30,
                    color: textColor, // Cor do texto de acordo com o tema
                  }}
                  placeholder="Pesquisar..."
                  placeholderTextColor={placeholderTextColor} // Cor do placeholder
                  value={searchText}
                  onChangeText={setSearchText}
                />
                {/* Botão de pesquisa (lupa) à direita */}
                <TouchableOpacity  style={{
                    padding: 5,
                    backgroundColor: "#5AC8FA", // Cor de fundo do botão
                    borderRadius: 5, // Bordas arredondadas para o botão
                    justifyContent: 'center',
                    alignItems: 'center',
                  }}>
                  <IconSymbol size={30} name="magnifyingglass" color={textColor === '#FFF' ? '#000' : '#FFF'} />
                </TouchableOpacity>
              </View>
            </View>
          ),
          tabBarButton: HapticTab,
          tabBarStyle: {
            backgroundColor: Colors[colorScheme ?? 'light'].background,
            position: Platform.OS === 'ios' ? 'absolute' : 'relative',
          },
        }}
      >
        <Tabs.Screen
          name="index"
          options={{
            title: 'Início',
            tabBarIcon: ({ color }) => <IconSymbol size={28} name="house.fill" color={color} />,
          }}
        />
        <Tabs.Screen
          name="account"
          options={{
            title: 'Conta',
            tabBarIcon: ({ color }) => <IconSymbol size={28} name="person.fill" color={color} />,
          }}
        />
        <Tabs.Screen
          name="properties"
          options={{
            title: 'Propriedades',
            tabBarIcon: ({ color }) => <IconSymbol size={28} name="building.2.fill" color={color} />,
          }}
        />
        <Tabs.Screen
          name="menu"
          options={{
            title: 'Menu',
            tabBarIcon: ({ color }) => <IconSymbol size={28} name="list.bullet" color={color} />,
          }}
        />
      </Tabs>
    </View>
  );
}
