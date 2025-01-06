-- CreateEnum
CREATE TYPE "AgentType" AS ENUM ('hmai', 'OPENAI_ASSISTANT');

-- AlterTable
ALTER TABLE "Agent" ADD COLUMN     "type" "AgentType" NOT NULL DEFAULT 'hmai';
