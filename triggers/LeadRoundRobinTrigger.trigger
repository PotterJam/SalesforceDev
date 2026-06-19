trigger LeadRoundRobinTrigger on Lead (before insert) {
    RoundRobinHandler.handleBeforeInsert(Trigger.new);
}
