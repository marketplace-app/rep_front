/*Impotação de dados

- Tema dark, padrão, provider
- ThemeProvide é um componenete de contexto que permite o gerenciamento de cores, fontes e estilos, no aplicativo deve ser a base de toda a árvore de todos os componentes
- useFont para carregar fontes do aplicativo
- useEffect realiza modificações em tempo real na tela de renderização após chamadas de API, timers.
- Pilha para realizar alterações de telas com o expo router
- SplashScreen que serve para que durante o processo de carregamento de tela seja realizado algum processo para melhorar a experiência do usuário
- StatusBar que controla a barara de status do aplicativo onde aparece as informações no topo da tela de hora, bateria, wifi, e notificações
- useColorScheme detecta o tema do sistema para alterar para o dark ou o light
*/

import { DarkTheme, DefaultTheme, ThemeProvider } from '@react-navigation/native';
import { useFonts } from 'expo-font';
import { Stack } from 'expo-router';
import * as SplashScreen from 'expo-splash-screen';
import { StatusBar } from 'expo-status-bar';
import { useEffect } from 'react';
import 'react-native-reanimated';

import { useColorScheme } from '@/hooks/useColorScheme';

// Impedindo que a tela de carregamento seja oculta até que o carregamento de fontes e cores estejam finalizados
SplashScreen.preventAutoHideAsync();

export default function RootLayout() {
  const colorScheme = useColorScheme(); //Carrega o hook do tema do sistema
  const [loaded] = useFonts({
    SpaceMono: require('../assets/fonts/SpaceMono-Regular.ttf'),
  });//carrega a fonte que está armazenada no assets, o retorno está trazendo uma lista e dentro dela possuio o primeiro item como boolean que está sendo armazenado no loaded 


  //Se estiver carregado ele oculta a tela de carregamento e inicializa o aplicativo, caso contrario ficará a tela para sempre
  useEffect(() => {
    if (loaded) {
      SplashScreen.hideAsync();
    }
  }, [loaded]);

  if (!loaded) {
    return null;
  }


  //Esse é o retorno da tela inicial do aplicativo
  return (
    //Valida se o tema do sistema é dark ou ligth
    <ThemeProvider value={colorScheme === 'dark' ? DarkTheme : DefaultTheme}> 
      <Stack>({/*Inicia a pilha de páginas*/})
        <Stack.Screen name="(tabs)" options={{ headerShown: false }} />  ({/*A primeira tela adicionando o nome dela e removendo a opção de cabeçalho*/})
        <Stack.Screen name="+not-found" />({/*É uma tela quando ocorre algum erro chamada de não encontrada*/})
      </Stack>
      <StatusBar style="auto" />({/*Deixa a cor de acordo com o estilo do disposito se for dark ou ligth*/})
    </ThemeProvider>
  );
}
