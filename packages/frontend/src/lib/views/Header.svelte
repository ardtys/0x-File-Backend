<script lang="ts">
	import { status } from '$lib/stores/status'

	function reset() {
		window.location.reload()
	}
</script>

<header>
	<a class="logo" onclick={reset} href="/">
		{#if $status?.theme_image}
			<img alt="logo" src={$status.theme_image} />
		{:else}
			<img alt="0x File Logo" src="/0x-icon.png" />
		{/if}
	</a>
</header>

<style>
	header {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin-top: 1rem;
		margin-bottom: 2rem;
	}

	a.logo {
		border: none;
		text-align: center;
	}

	img {
		object-fit: contain;
	}

	header img {
		max-width: 18rem;
		max-height: 18rem;
		height: auto;
		width: auto;
	}

	/* Light mode: logo hitam solid */
	:global(:root[theme='light']) header img {
		filter: brightness(0) invert(0);
	}

	/* Dark mode: logo putih solid */
	:global(:root[theme='dark']) header img {
		filter: brightness(0) invert(1);
	}

	/* Auto mode: ikuti sistem */
	@media (prefers-color-scheme: light) {
		:global(:root[theme='auto']) header img {
			filter: brightness(0) invert(0);
		}
	}

	@media (prefers-color-scheme: dark) {
		:global(:root[theme='auto']) header img {
			filter: brightness(0) invert(1);
		}
	}
</style>
