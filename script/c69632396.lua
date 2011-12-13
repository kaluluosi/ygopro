--ゴブリンのその場しのぎ
function c69632396.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_NEGATE+CATEGORY_TOHAND)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_CHAINING)
	e1:SetCondition(c69632396.condition)
	e1:SetCost(c69632396.cost)
	e1:SetTarget(c69632396.target)
	e1:SetOperation(c69632396.activate)
	c:RegisterEffect(e1)
end
function c69632396.condition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetChainInfo(ev,CHAININFO_TYPE)==TYPE_SPELL and re:IsHasType(EFFECT_TYPE_ACTIVATE) and Duel.IsChainInactivatable(ev)
end
function c69632396.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.CheckLPCost(tp,500) end
	Duel.PayLPCost(tp,500)
end
function c69632396.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return re:GetHandler():IsAbleToHand() end
	Duel.SetOperationInfo(0,CATEGORY_NEGATE,eg,1,0,0)
	if re:GetHandler():IsRelateToEffect(re) then
		Duel.SetOperationInfo(0,CATEGORY_TOHAND,eg,1,0,0)
	end
end
function c69632396.activate(e,tp,eg,ep,ev,re,r,rp)
	Duel.NegateActivation(ev)
	if re:GetHandler():IsRelateToEffect(re) then
		ec:CancelToGrave()
		Duel.SendtoHand(ec,nil,REASON_EFFECT)
	end
end