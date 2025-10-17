alpha += (alpha_amount * alpha_factor);
alpha = clamp(alpha, 0, 1);

if (alpha >= 0.7 && alpha <= 0.99)
    alarm[0] = timer_full_white;

if (alpha_factor == -1 && alpha <= 0.01)
{
}
