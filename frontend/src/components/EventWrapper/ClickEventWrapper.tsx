import React from 'react';
import styled from 'styled-components';
import { useRouter } from 'next/router';
import api from '@api/index';

// type EventType = 'move' | 'click' | 'library' | 'login' | 'logout' | 'logout' | 'music' | 'error';
// type ActionType =
//   | 'like'
//   | 'remove'
//   | 'prev'
//   | 'next'
//   | 'shuffle_on'
//   | 'shuffle_off'
//   | 'play'
//   | 'pause'
//   | 'repeat_on'
//   | 'repeat_off';

interface IClickEventProps {
  target: string;
  id?: number | null;
  children?: any;
}

interface IEventTargetProps {
  onClick?: React.MouseEventHandler<HTMLButtonElement>;
}

function ClickEventWrapper({ target, id, children }: IClickEventProps) {
  const router = useRouter();

  const logData = {
    eventName: 'click_event',
    parameters: { page: router.asPath, target: id ? `${target}/${id}` : target },
  };

  const postClickLog = () => {
    api.post('/log', { ...logData, eventTime: new Date() });
  };

  return <Wrapper onClick={postClickLog}>{children}</Wrapper>;
}

const Wrapper = styled.div<IEventTargetProps>`
  width: 100%;
  cursor: pointer;
`;

export default ClickEventWrapper;
