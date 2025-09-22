'use client'
export default function ImageUploader({ onUpload }) {
  const handleUpload = async (e) => {
    const file = e.target.files[0];
    if (!file) return;

    const formData = new FormData();
    formData.append('file', file);
    const response = await fetch('/api/upload', {
      method: 'POST',
      body: formData,
    });
    const { url } = await response.json();
    onUpload(url);
  };

  return (
    <div>
      <label className="text-neutral-dark">Upload Image</label>
      <input
        type="file"
        accept="image/*"
        onChange={handleUpload}
        className="w-full p-2 border rounded"
      />
    </div>
  );
}