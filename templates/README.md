# Templates

Reusable templates and boilerplates for creating your own stacks.

## Available Templates

### STACK_TEMPLATE

Complete stack template with all necessary files and best practices.

**Usage:**

```bash
# Copy the template
cp -r templates/STACK_TEMPLATE stacks/category/your-stack-name

# Navigate to your new stack
cd stacks/category/your-stack-name

# Customize the files
# - Edit docker-compose.yml
# - Modify .env.example
# - Update README.md
```

## Creating Your Own Stack

1. **Copy the template** to the appropriate category
2. **Customize docker-compose.yml** with your services
3. **Update .env.example** with required variables
4. **Write comprehensive README.md** documentation
5. **Test thoroughly** before committing

See [../docs/CONTRIBUTING.md](../docs/CONTRIBUTING.md) for detailed guidelines.

## Best Practices

- Follow the standard directory structure
- Include health checks for all services
- Set resource limits
- Provide clear documentation
- Use environment variables for configuration
- Never hardcode secrets

## Need Help?

Check the [getting started guide](../docs/getting-started.md) or look at existing stacks in `stacks/` for examples.
