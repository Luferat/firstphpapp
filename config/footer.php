<?php

/** footer.php
 * Fechamento do tema das páginas do aplicativo.
 */

?>
</main>

<footer>
    <a href="/" title="Página inicial"><i class="fas fa-home fa-fw"></i></a>
    <div>&copy; Copyright <?= $app_year ?> <?= $C['appOwner'] ?>.</div>
    <a href="#top" title="Topo da página"><i class="fas fa-arrow-alt-circle-up fa-fw"></i></a>
</footer>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/global.js"></script>
<?= $page_js ?>

</body>

</html>