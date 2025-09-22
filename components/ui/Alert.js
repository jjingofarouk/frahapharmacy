export default function Alert({ children, variant = 'info' }) {
  const styles = {
    info: 'bg-pharmacy-green text-white',
    error: 'bg-error-red text-white',
  };

  return (
    <div className={`p-4 rounded ${styles[variant]}`}>
      {children}
    </div>
  );
}