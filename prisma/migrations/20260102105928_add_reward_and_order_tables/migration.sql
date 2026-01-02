-- CreateTable
CREATE TABLE "Rewardpoint" (
    "id" TEXT NOT NULL,
    "customerid" TEXT NOT NULL,
    "pointvalue" INTEGER NOT NULL,
    "pendingpoint" INTEGER NOT NULL DEFAULT 0,
    "activepoint" INTEGER NOT NULL DEFAULT 0,
    "store" TEXT NOT NULL,
    "customeremail" TEXT NOT NULL,
    "dob" TIMESTAMP(3),
    "anniversaryDate" TIMESTAMP(3),
    "lastBirthdayRewardYear" INTEGER,
    "lastAnniversaryRewardYear" INTEGER,
    "birthdayPoint" INTEGER NOT NULL DEFAULT 0,
    "anniversaryPoint" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "Rewardpoint_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderHistory" (
    "id" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,
    "orderNumber" TEXT,
    "status" TEXT NOT NULL DEFAULT 'PENDING',
    "discountAmount" DOUBLE PRECISION NOT NULL,
    "couponCode" TEXT,
    "pointsEarned" INTEGER NOT NULL,
    "pointsRedeemed" INTEGER NOT NULL,
    "pointsRevert" INTEGER NOT NULL DEFAULT 0,
    "highRewardPoint" INTEGER NOT NULL DEFAULT 0,
    "subtotal" DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    "productNames" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "rewardPointId" TEXT NOT NULL,

    CONSTRAINT "OrderHistory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "OrderHistory_orderId_key" ON "OrderHistory"("orderId");

-- AddForeignKey
ALTER TABLE "OrderHistory" ADD CONSTRAINT "OrderHistory_rewardPointId_fkey" FOREIGN KEY ("rewardPointId") REFERENCES "Rewardpoint"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
