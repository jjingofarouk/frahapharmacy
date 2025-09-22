export default function Select({ label, options, error, ...props }) {
  return (
    <div className="space-y-1">
      {label && <label className="text-neutral-dark">{label}</label>}
      <select
        className={`w-full p-2 border rounded ${error ? 'border-error-red' : 'border-neutral-light'}`}
        {...props}
      >
        <option value="">Select an option</option>
        {options.map(option => (
          <option key={option.value} value={option.value}>{option.label}</option>
        ))}
      </select>
      {error && <p className="text-error-red text-sm">{error}</p>}
    </div>
  );
}