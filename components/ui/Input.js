export default function Input({ label, error, ...props }) {
  return (
    <div className="space-y-1">
      {label && <label className="text-neutral-dark">{label}</label>}
      <input
        className={`w-full p-2 border rounded ${error ? 'border-error-red' : 'border-neutral-light'}`}
        {...props}
      />
      {error && <p className="text-error-red text-sm">{error}</p>}
    </div>
  );
}