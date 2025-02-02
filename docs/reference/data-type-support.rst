.. meta::
   :description: hipSPARSELt API library data type support
   :keywords: hipSPARSELt, ROCm, API library, API reference, data type, support

.. _data-type-support:

******************************************
Data type support
******************************************

.. csv-table::
   :header: "Input", "Output", "Compute type", "Backend"

   "HIPSPARSELT_R_16F", "HIPSPARSELT_R_16F", "HIPSPARSELT_COMPUTE_32F", "HIP"
   "HIPSPARSELT_R_16BF", "HIPSPARSELT_R_16BF", "HIPSPARSELT_COMPUTE_32F", "HIP"
   "HIPSPARSELT_R_8I", "HIPSPARSELT_R_8I", "HIPSPARSELT_COMPUTE_32I", "HIP / CUDA"
   "HIPSPARSELT_R_8I", "HIPSPARSELT_R_16F", "HIPSPARSELT_COMPUTE_32I", "HIP / CUDA"
   "HIPSPARSELT_R_16F", "HIPSPARSELT_R_16F", "HIPSPARSELT_COMPUTE_16F", "CUDA"
   "HIPSPARSELT_R_16BF", "HIPSPARSELT_R_16BF", "HIPSPARSELT_COMPUTE_16F", "CUDA"
   "HIPSPARSELT_R_32F", "HIPSPARSELT_R_32F", "HIPSPARSELT_COMPUTE_TF32", "CUDA"
   "HIPSPARSELT_R_32F", "HIPSPARSELT_R_32F", "HIPSPARSELT_COMPUTE_TF32_FAST", "CUDA"
