CREATE DATABASE YouTubeDB;
USE YouTubeDB;

CREATE TABLE Usuarios (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    NombreUsuario VARCHAR(255),
    FechaNacimiento DATE,
    Sexo VARCHAR(10),
    Pais VARCHAR(50),
    CodigoPostal VARCHAR(10)
);

CREATE TABLE Videos (
    VideoID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255),
    Descripcion TEXT,
    Tamano INT,
    NombreArchivoVideo VARCHAR(255),
    Duracion TIME,
    Thumbnail VARCHAR(255),
    Reproducciones INT DEFAULT 0,
    Likes INT DEFAULT 0,
    Dislikes INT DEFAULT 0,
    Estado ENUM('publico', 'oculto', 'privado') NOT NULL,
    UsuarioID INT,
    FechaPublicacion DATETIME,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UserID)
);

CREATE TABLE Etiquetas (
    EtiquetaID INT AUTO_INCREMENT PRIMARY KEY,
    NombreEtiqueta VARCHAR(50)
);

CREATE TABLE VideosEtiquetas (
    VideoID INT,
    EtiquetaID INT,
    PRIMARY KEY (VideoID, EtiquetaID),
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID),
    FOREIGN KEY (EtiquetaID) REFERENCES Etiquetas(EtiquetaID)
);

CREATE TABLE Canales (
    CanalID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT,
    FechaCreacion DATE,
    UsuarioID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UserID)
);

CREATE TABLE Suscripciones (
    SuscripcionID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    CanalID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UserID),
    FOREIGN KEY (CanalID) REFERENCES Canales(CanalID)
);

CREATE TABLE LikesDislikesVideos (
    LikeDislikeID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    VideoID INT,
    Tipo ENUM('like', 'dislike') NOT NULL,
    FechaHoraAccion DATETIME,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UserID),
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID)
);

CREATE TABLE Playlists (
    PlaylistID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    FechaCreacion DATE,
    Estado ENUM('publica', 'privada') NOT NULL,
    UsuarioID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UserID)
);

CREATE TABLE VideosPlaylists (
    VideoID INT,
    PlaylistID INT,
    PRIMARY KEY (VideoID, PlaylistID),
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID),
    FOREIGN KEY (PlaylistID) REFERENCES Playlists(PlaylistID)
);

CREATE TABLE Comentarios (
    ComentarioID INT AUTO_INCREMENT PRIMARY KEY,
    TextoComentario TEXT,
    FechaHoraComentario DATETIME,
    VideoID INT,
    UsuarioID INT,
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UserID)
);

CREATE TABLE LikesDislikesComentarios (
    LikeDislikeID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    ComentarioID INT,
    Tipo ENUM('like', 'dislike') NOT NULL,
    FechaHoraAccion DATETIME,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UserID),
    FOREIGN KEY (ComentarioID) REFERENCES Comentarios(ComentarioID)
);

INSERT INTO Usuarios (Email, Password, NombreUsuario, FechaNacimiento, Sexo, Pais, CodigoPostal)
VALUES
  ('usuario1@example.com', 'contrasena1', 'JohnDoe', '1990-05-15', 'M', 'Estados Unidos', '90210'),
  ('usuario2@example.com', 'contrasena2', 'JaneSmith', '1985-12-10', 'F', 'Canadá', 'H2X1Y2'),
  ('usuario3@example.com', 'contrasena3', 'MariaGarcía', '1998-08-22', 'F', 'España', '28001'),
  ('usuario4@example.com', 'contrasena4', 'CarlosLópez', '2000-03-30', 'M', 'México', '12345'),
  ('usuario5@example.com', 'contrasena5', 'SophieMartin', '1995-07-05', 'F', 'Francia', '75001');

INSERT INTO Videos (Titulo, Descripcion, Tamano, NombreArchivoVideo, Duracion, Thumbnail, Estado, UsuarioID, FechaPublicacion)
VALUES
  ('Vacaciones en Hawai', 'Un video sobre nuestras vacaciones en Hawai', 2048, 'hawaii_vacaciones.mp4', '00:12:45', 'thumbnail_hawaii.jpg', 'publico', 1, NOW()),
  ('Receta de Pastel de Chocolate', 'Aprende a hacer un delicioso pastel de chocolate', 1024, 'pastel_chocolate.mp4', '00:08:30', 'thumbnail_pastel.jpg', 'privado', 2, NOW()),
  ('Entrenamiento de CrossFit', 'Rutina intensa de entrenamiento de CrossFit', 1536, 'crossfit_entrenamiento.mp4', '00:20:15', 'thumbnail_crossfit.jpg', 'publico', 3, NOW()),
  ('Resumen del Mundial de Fútbol', 'Lo mejor del Mundial de Fútbol 2022', 4096, 'mundial_resumen.mp4', '00:16:30', 'thumbnail_mundial.jpg', 'oculto', 4, NOW()),
  ('Viaje por la Ruta 66', 'Nuestro viaje por la histórica Ruta 66 en EE. UU.', 8192, 'ruta66_viaje.mp4', '00:42:00', 'thumbnail_ruta66.jpg', 'publico', 5, NOW());

INSERT INTO Etiquetas (NombreEtiqueta)
VALUES
  ('Viajes'),
  ('Cocina'),
  ('Deportes'),
  ('Música'),
  ('Educación');

INSERT INTO Canales (Nombre, Descripcion, FechaCreacion, UsuarioID)
VALUES
  ('Canal de Viajes', 'Explorando el mundo', '2022-01-15', 1),
  ('Canal de Cocina', 'Recetas deliciosas', '2022-02-20', 2),
  ('Canal de Deportes', 'Lo mejor en deportes', '2022-03-25', 3),
  ('Canal de Música', 'Música para todos', '2022-04-30', 4),
  ('Canal de Educación', 'Aprendizaje en línea', '2022-05-05', 5);

INSERT INTO Suscripciones (UsuarioID, CanalID)
VALUES
  (1, 2),
  (2, 1),
  (3, 1),
  (4, 3),
  (5, 4);

INSERT INTO Comentarios (TextoComentario, FechaHoraComentario, VideoID, UsuarioID)
VALUES
  ('Gran video, me encantó el contenido', '2023-01-10 08:30:00', 1, 2),
  ('¡Excelente explicación! Gracias por compartir', '2023-01-12 15:45:00', 2, 3),
  ('Este video es asombroso, no puedo dejar de verlo', '2023-01-14 19:20:00', 3, 4),
  ('¿Puedes hacer un tutorial sobre temas relacionados?', '2023-01-16 12:10:00', 4, 5),
  ('Buen video, pero creo que podría ser más corto', '2023-01-18 10:05:00', 5, 1);

INSERT INTO LikesDislikesComentarios (UsuarioID, ComentarioID, Tipo, FechaHoraAccion)
VALUES
  (1, 1, 'like', '2023-01-10 09:00:00'),
  (2, 1, 'dislike', '2023-01-10 09:30:00'),
  (3, 2, 'like', '2023-01-11 10:15:00'),
  (4, 3, 'like', '2023-01-12 14:20:00'),
  (5, 4, 'dislike', '2023-01-13 16:45:00');

INSERT INTO LikesDislikesVideos (UsuarioID, VideoID, Tipo, FechaHoraAccion)
VALUES
  (1, 1, 'like', '2023-01-10 09:00:00'),
  (2, 1, 'dislike', '2023-01-10 09:30:00'),
  (3, 2, 'like', '2023-01-11 10:15:00'),
  (4, 3, 'like', '2023-01-12 14:20:00'),
  (5, 4, 'dislike', '2023-01-13 16:45:00');

INSERT INTO Playlists (Nombre, FechaCreacion, Estado, UsuarioID)
VALUES
  ('Favoritos de Viajes', '2023-01-10', 'publica', 1),
  ('Canciones Relajantes', '2023-01-11', 'publica', 2),
  ('Mis Videos Deportivos', '2023-01-12', 'privada', 3),
  ('Aprendizaje en Línea', '2023-01-13', 'publica', 4),
  ('Mis Recetas', '2023-01-14', 'privada', 5);

INSERT INTO VideosEtiquetas (VideoID, EtiquetaID)
VALUES
  (1, 1), 
  (1, 2), 
  (2, 3), 
  (2, 4),  
  (3, 5); 
  
INSERT INTO VideosPlaylists (VideoID, PlaylistID)
VALUES
  (1, 1),
  (2, 1),
  (3, 2),
  (4, 2),
  (5, 3);

