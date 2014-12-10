<!DOCTYPE html>
<html>
<head>
  <title>: Ayuda</title>
  <meta name="layout" content="bootstrap">
</head>
<body>
<div class="page">
  <ol class="breadcrumb">
    <li><a href="${createLink(uri: '/') }">Inicio</a></li>
    <li class="active">Ayuda</li>
  </ol>

  <div class="vertical ui-wizard-form">
    <h1>Crea tu intercambio <span class="fa fa-gift pull-right fa-2x"></span></h1>
    <div>
      <p>En la página <a href="${createLink(controller: 'exchange', action: 'index')}">Intercambios</a>, haz click en el botón para configurar tu intercambio.
      Elige el nombre que identificará a tu intercambio y escoge una fecha, también puedes asignar un límite de presupuesto y escoger un tema para tu intercambio.</p>

      <p>Puedes crear los intercambios que necesites, por ejemplo para tu trabajo, amigos o familia.</p>

      <asset:image src="screen1.jpg" class="img-thumbnail" />
    </div>

    <h1>Agrega a los participantes <span class="fa fa-users pull-right fa-2x"></span></h1>
    <div>
      <p>Una vez configurado tu intercambio, puedes acceder a él desde la página de <a href="${createLink(controller: 'exchange', action: 'index')}">Intercambios</a>,
        donde puedes comenzar a agregar los usuarios que participarán en tu intercambio, ingresa nombre y correo electrónico para agregarlos a la lista de participantes.
      </p>

      <p>Puedes usar el botón verde si tu también participas en el intercambio.</p>

      <asset:image src="screen2.jpg" class="img-thumbnail" />
    </div>

    <h1>Asigna usuarios <span class="fa fa-random pull-right fa-2x"></span></h1>
    <div>
      <p>Cuando hayas terminado de agregar a todos los participantes, haz click en el botón de la barra lateral <em>Asignar usuarios</em> para que
      los participantes sean asignados.</p>

      <p>Cada participante recibiará un correl electrónico con el nombre del intercambio al que está invitado, la fecha, el tema, límite y la persona a la
      que le toca dar regalo.</p>

      <p>El correo electrónico también contendrá un enlace para que el participante pueda elegir 3 opciones, las cuales serán enviadas a la persona que le
       toco darle regalo.</p>

      <asset:image src="screen3.png" class="img-thumbnail" />
    </div>

    <h1>Envía recordatorios <span class="fa fa-envelope pull-right fa-2x"></span></h1>
    <div>
      <p>Cuando la fecha del intercambio se acerque, envía un recordatorio al usuario haciendo click en el botón de la barra lateral <em>Enviar recordatorios</em></p>
    </div>
  </div>
</div>
</body>
</html>