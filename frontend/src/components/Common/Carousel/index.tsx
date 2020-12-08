import Carousel from 'react-bootstrap/Carousel';
import styled from '@styles/themed-components';

const MyCarousel = ({ children, groupSize }) => {
  const rows = children
    .map(card => <>{card}</>)
    .reduce((r, element, index) => {
      index % groupSize === 0 && r.push([]);
      r[r.length - 1].push(element);
      return r;
    }, [])
    .map(rowContent => (
      <Carousel.Item key={rowContent.id}>
        <ContentWrapper>{rowContent}</ContentWrapper>
      </Carousel.Item>
    ));
  return (
    <Wrapper>
      <Carousel interval={null} keyboard={false}>
        {rows}
      </Carousel>
    </Wrapper>
  );
};

const ContentWrapper = styled.div`
  width: 100%;
  display: flex;
  padding: 20px 0;
  justify-content: space-between;
`;

const Wrapper = styled.div`
  .carousel {
    position: relative;
  }
  .carousel-control-prev,
  .carousel-control-next {
    background: white;
    box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.1);
    width: 40px;
    height: 40px;
    position: absolute;
    top: 35%;
    border-radius: 50%;
    opacity: 100%;
  }
  .carousel-control-prev {
    left: -20px;
  }
  .carousel-control-next {
    right: -20px;
  }
  .carousel-control-prev-icon {
    background-image: url('https://icons-for-free.com/iconfiles/png/512/next+icon-1320085938867901461.png');
    transform: rotate(180deg);
  }
  .carousel-control-next-icon {
    background-image: url('https://icons-for-free.com/iconfiles/png/512/next+icon-1320085938867901461.png');
  }
  .carousel-indicators {
    display: none;
  }
`;

export default MyCarousel;
